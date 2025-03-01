import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// 파이어베이스 쓰려면 넣어라.. 오류난다
import 'package:firebase_auth/firebase_auth.dart';
import 'package:upstock/profile/announcement.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shimmer/shimmer.dart'; // 차트 임포트임 없으면 차트 못 그림ㅋㅋ
import 'package:timeago/timeago.dart' as timeago;

final auth = FirebaseAuth.instance;
final storage = FirebaseStorage.instance;

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  // 내용 저장
  List<Map<String, dynamic>> usercontext = [];

  // 이미지 변수고 이미지 url 여기다가 다 처 넣을거임 ? = null이 아니라는 것을 보장
  List<String?> imageUrl = [];

  // 사진 및 게시글 로딩 중
  bool isLoading = false;

  // 글 내용 불러오기
  getData() async {

    // 한국어 지원해주셈 ㄷㄷ
    timeago.setLocaleMessages('ko', timeago.KoMessages());

    // 로딩 걸어야지 Shimmer 쓸 수 있음
    setState(() {
      isLoading = true;
    });

    var result = await firestore
        .collection('user')
        // date 순으로 정렬 기능
        .orderBy('date', descending: true)
        .get();

    List<Map<String, dynamic>> result2 = [];
    // url 임시로 저장할 곳
    List<String?> imageUrlresult = [];

    // 문서 반복문으로 다 저장 ㅋㅋ 쿼리 쓴거임
    for (var doc in result.docs) {

      // 각 데이터를 Map 형태로 가져옴
      var allData = doc.data();

      // containsKey는 맵 자료에 'date'가 있으면 true 반환
      if (allData.containsKey('date')) {
        // date timestamp를 date로 변환해서 data에 저장
        DateTime data = (allData['date'] as Timestamp).toDate();
        // timeago로 맵 자료에 저장
        allData['timeago'] = timeago.format(data, locale: 'ko');
      }

      // imageNumber을 전달
      String? url = await loadContextImage(doc.id);
      // 이미지 변수에 url 저장
      imageUrlresult.add(url);

      // result2에 timeago 밀어넣기
      result2.add(allData);
    }

    setState(() {
      usercontext = result2;
      imageUrl = imageUrlresult;
      isLoading = false;
    });

  }

  // 이미지 매개변수 받은거 사용
  loadContextImage(String imageNumber) async {
    try {
      final ref = storage.ref().child('userContext/$imageNumber');
      return await ref.getDownloadURL();
    } catch (e) {
      print(e);
    }
  }

  // 좋아요 버튼
  bool pressLike = false;

  // 좋아요
  clickLike() async {

    try {
      setState(() {
        if (pressLike == false) {
          pressLike = true;
          firestore.collection('user').doc('1').update({'like' : 1});
        } else {
          pressLike = false;
          firestore.collection('user').doc('1').update({'like' : 0});
        }
      });
    } catch(e) {
      print(e);
    }

  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate:
            SliverChildBuilderDelegate(childCount: usercontext.length, (c, i) {
      return SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                            'https://ne7k.github.io/app/profile.jpg')),

                    SizedBox(width: 15),

                    // todo 글쓴이 사용자 이름으로 바꿔야함
                    Text(usercontext[i]['username'] ?? 'name',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),

              SizedBox(height: 10),
              buildImageNotEmpty(imageUrl[i]),
              SizedBox(height: 15),
              Row(
                children: [
                  SizedBox(width: 20),
                  // 유저 아이디
                  Text(usercontext[i]['username'] ?? 'name',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  SizedBox(width: 10),
                  Text('${usercontext[i]['context']}',
                      style: TextStyle(fontSize: 14)),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [

                    SizedBox( height: 5 ),

                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(usercontext[i]['timeago'].toString(),
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                fontSize: 10
                              )),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              clickLike();
                            },
                            icon: pressLike ? Icon(Icons.favorite, color: Colors.red) : Icon(Icons.favorite_outline),
                        ),

                        Text(usercontext[i]['like'].toString()),

                        // 댓글
                        // IconButton(
                        //     onPressed: () {}, icon: Icon(Icons.messenger_outline)),
                        // Text('2')
                      ],
                    ),

                  ],
                ),
              )
            ],
          ));
    }));
  }
}

// 이미지 널이면 빈텍스트 보여줘야함 ㅋㅋㅋㅋ
Widget buildImageNotEmpty(String? imageUrl) {
  return imageUrl != null ? Image.network(imageUrl) : SizedBox();
}

// Shimmer Effect 틀
class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        // 카드뷰
        child: Column(
          children: [
            Row(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                )
              ],
            )
          ],
        ),
      )
    ]);
  }
}
