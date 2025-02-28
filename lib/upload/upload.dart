import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

// imagepicker import
import 'package:image_picker/image_picker.dart';
import 'dart:io';

// 파이어베이스 쓰려면 넣어라.. 오류난다
import 'package:firebase_auth/firebase_auth.dart';
import 'package:upstock/profile/announcement.dart';

final auth = FirebaseAuth.instance;
final base = FirebaseStorage.instance;

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {

  TextEditingController userContext = TextEditingController();

  // 파이어베이스 내에 존재하는 contextdata post count 초기화
  final countdocumment = firestore.collection('contextdata').doc('post');

  checkFirebaseCountData() async {
      final checkCount = await countdocumment.get();
      // 게시글이 존재하지 않으면 0으로 초기화
      if (!checkCount.exists) {
        await countdocumment.set({'count' : 0});
      }
  }

  // 업로드
  userPost() async {
    // initstate에 넣는 것보다는 포스트할 때에만 작동되게 끔하는게 좋을듯
    checkFirebaseCountData();
    // 트랜잭션했음 이유는 데이터베이스 작업을 하나로 묶어서 함 ㅇㅇ 그래서 하나가 실패하면 아예 취소되는거임 그래야 카운트가 잘 되니까
    try {
      firestore.runTransaction((transaction) async {
        final checkCount = await transaction.get(countdocumment);
        int currentCount = checkCount.get('count');
        int newCount = currentCount + 1;

        // 이미지 선택한 것도 업로드할 수 있게 만들자 ㅋㅋ
        if (userContextImage != null) {
          // 파일 이름은 카운트에 맞게 그래야 불러오기 쉬울듯?
          String fileName = newCount.toString();
          // Reference = 파일 작업
          Reference firebasestorage = base.ref().child('userContext/$fileName');
          await firebasestorage.putFile(userContextImage);
        }

        // 이거 future 쓰라는거 같은데 머지 ㅋㅋㅋ > await 삭제함
         transaction
            .set(firestore
            .collection('user')
            .doc(newCount.toString()), {
              'username' : auth.currentUser!.displayName,
              'context' : userContext.text,
              'like' : 0, // 이거 나중에 그냥 서버에 +1만 해주면댐 ㅋㅋ
            });

        // 카운트 +1해준 값 데베로 보내기
        transaction.update(countdocumment, {'count' : newCount});
        // 업로드 되었다는 표시
        if(mounted) ScaffoldMessenger.of(context).showSnackBar(finishUpload);
      });
    } catch(e) {
      print(e);
    }
  }

  final finishUpload = SnackBar(
      content: Text('업로드함 ㅋㅋ'),
    duration: Duration( seconds: 2),
  );

  // image 저장
  var userContextImage;
  // 이미지 표시 안되게 처리
  bool loadImage = false;

  userimagePick() async {
    var picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);
    // picker.pickMultiImage(source: ImageSource.gallery); 이거는 사진 여러가지 선택

    if (image != null) {
      setState(() {
        userContextImage = File(image.path);
        loadImage = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 이거 추가하면 키보드 올린 상태에서 다른 곳 누르면 키보드 내려감 ㅋㅋㅋㅋㅋㅋㅋㅋㅋ 없으면 큰일남
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('새 게시물', style: TextStyle( fontWeight: FontWeight.bold) ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Container(
              color: Colors.grey[300],
              height: 1.0,
            ),
          ),
        ),
      
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          
                Text('이미지 업로드', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 22)),
          
                SizedBox( height: 20 ),
          
                // 사진 업로드 및 표시
                Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        border: Border.all( color: Colors.grey ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      // todo 업로드된 사진들은 오른쪽으로 배치 (후에 이미지 여러 개 배치)
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              IconButton(onPressed: () {
                                userimagePick();
                              }, icon: Icon(Icons.camera_alt_outlined, color: Colors.grey[500])),
                              Text('0/1', style: TextStyle( fontSize: 14, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
      
                    SizedBox( width: 10 ),
      
                    // 이미지가 선택이 안되었을 때에는 아무것도 안띄워주다가 이미지 선택되면 이미지 보여주기
                    loadImage
                        ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(userContextImage, height: 70, width: 70, fit: BoxFit.fill),
                    )
                        : Text(''),
      
                  ],
                ),
          
                SizedBox( height: 30 ),
          
                Text('내용', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 22)),
          
                SizedBox( height: 10 ),
          
                TextField(
                  controller: userContext,
                  maxLength: 2000,
                  // null 값 주면 야매로 텍스트 필드 넓힐 수 있음 개꿀 ㅋㅋㅋㅋㅋㅋㅋ
                  maxLines: null,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    // 텍스트 필드 크기 키우기
                    hintText: '''글 내용
                    
                    
                    
                    
                    
                    
                   
                    ''',
                    // 글 내용이라서 수직줘서 크기 키움
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                      // 누르지 않았을 때
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide( color: Colors.grey.shade200, width: 1.5 ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      // 눌렀을 때
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide( color: Colors.grey.shade200, width: 1.5 ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                  ),
                ),
          
                SizedBox( height: 30 ),
      
                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric( horizontal: 10 ),
                  decoration: BoxDecoration(
                      color: Colors.green[500],
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: SizedBox.expand(
                    // .expend 쓰면 container 크기만큼 클릭 ㅆㄱㄴ
                    child: TextButton(
                        onPressed: () {
                          userPost();
                        },
                        child: Text('업로드', style: TextStyle( color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold ))
                    ),
                  ),
                ),
      
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}
