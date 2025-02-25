import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  const Information({super.key});

  final explainText = '''
  서비스 제공을 위한 계약 이행 및 서비스 제공에 따른 요금정산
  회원 관리: 회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와 비인가 사용 방지
  신규 서비스 개발, 마케팅 및 광고에 활용: 신규 서비스 개발 및 맞춤 서비스 제공, 통계학적 특성에 따른 서비스 제공, 광고 게재, 접속 빈도 파악, 회원의 서비스 이용에 대한 통계''';

  final explainText2 = '''
  NeighborSoft은(는) 회원가입, 서비스 이용, 상담 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
  필수항목: 이메일, 이름, 비밀번호, 연락처
  선택항목: 주소, 결제정보 (선택항목은 입력하지 않아도 서비스 이용 제한은 없습니다.) ''';

  final explainText3 = '''
  NeighborSoft은(는) 법령에 따른 개인정보 보유·이용 기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유·이용 기간 내에서 개인정보를 처리, 보유합니다.
  계약 또는 회원가입 해지 시까지 등 서비스 이용자로서의 지위 유지에 필요한 기간 동안 개인정보를 보유합니다. 다만, 다음의 사유에 해당하는 경우 그 사유 종료시까지 보유할 수 있습니다.
  관계 법령 위반에 따른 수사·조사 등이 진행중인 경우에는 그 수사·조사 종료시까지
  소송 등의 경우 상당한 이유가 있는 경우에는 그 소송 등의 해결까지''';

  final explainText4 = '''
  사용자는 본 약관을 읽고 이에 동의한 경우에 한하여 NeighborSoft의 서비스를 사용할 수 있습니다.
  NeighborSoft은 법령이나 이용약관의 변경사항을 회원이 쉽게 알 수 있도록 공지사항을 통해 고지할 수 있습니다.''';

  final explainText5 = '''
  회원은 관계 법령, 본 약관의 규정, 이용안내 및 서비스와 관련하여 공지한 주의사항, NeighborSoft이 통지하는 사항 등을 준수하여야 합니다.
  회원은 내부정보를 유출하거나, NeighborSoft의 서비스를 방해하는 행위를 하여서는 안 됩니다.''';

  final explainText6 = '''
  회원이 이용약관의 의무를 위반할 경우 NeighborSoft은 법적 조치를 포함하여 서비스 이용을 일시적 또는 영구적으로 제한할 수 있습니다.
  회원이 계약을 해지하고자 하는 경우, 회원은 언제든지 서비스 내 제공되는 메뉴를 이용하여 이용계약 해지 신청을 할 수 있습니다.
  이 문서는 사용자가 NeighborSoft의 서비스를 이용하기 전에 반드시 숙지해야 할 중요한 내용을 담고 있습니다. 추가 문의사항이 있으시면 언제든지 NeighborSoft으로 문의해 주시기 바랍니다.''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text('개인정보보호 및 이용약관')),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 큰 제목
                Text('개인정보 보호정책',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

                SizedBox(height: 10),

                // 내용
                Text(
                  'NeighborSoft는 사용자의 개인정보를 소중히 다루며, 관련 법령에 따라 개인정보를 안전하게 취급합니다. 본 개인정보 보호정책은 NeighborSoft에서 제공하는 서비스(이하 "서비스")를 이용함에 있어 사용자의 정보가 어떻게 수집, 사용, 공유되는지를 설명합니다.',
                  style: TextStyle(fontSize: 14),
                ),

                SizedBox(height: 10),

                // 작은 제목
                Text('1. 개인정보의 수집 및 이용 목적',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700])),

                SizedBox(height: 10),

                // 내용
                Text(explainText, style: TextStyle(fontSize: 14)),

                SizedBox(height: 10),

                // 작은 제목
                Text('2. 수집하는 개인정보의 항목',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700])),

                SizedBox(height: 10),

                // 내용
                Text(explainText2, style: TextStyle(fontSize: 14)),

                SizedBox(height: 10),

                // 작은 제목
                Text('3. 개인정보의 보유 및 이용 기간',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700])),

                SizedBox(height: 10),

                // 내용
                Text(explainText3, style: TextStyle(fontSize: 14)),

                SizedBox(height: 20),

                // 큰 제목
                Text('이용약관',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

                SizedBox(height: 10),

                // 내용
                Text(
                  'NeighborSoft의 서비스 이용약관은 사용자가 우리의 서비스를 이용함에 있어 필요한 권리, 의무 및 책임사항을 명시합니다. 이 약관의 주요 내용은 다음과 같습니다.',
                  style: TextStyle(fontSize: 14),
                ),

                SizedBox(height: 10),

                // 작은 제목
                Text('1. 서비스 이용 조건 및 운영',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700])),

                SizedBox(height: 10),

                // 내용
                Text(explainText4, style: TextStyle(fontSize: 14)),

                SizedBox(height: 10),

                // 작은 제목
                Text('2. 회원의 의무',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700])),

                SizedBox(height: 10),

                // 내용
                Text(explainText5, style: TextStyle(fontSize: 14)),

                SizedBox(height: 10),

                // 작은 제목
                Text('3. 계약 해지 및 이용 제한',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700])),

                SizedBox(height: 10),

                // 내용
                Text(explainText6, style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ));
  }
}
