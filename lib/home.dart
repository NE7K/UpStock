import 'package:flutter/material.dart';

import 'package:http/http.dart' as http; // http import
import 'package:fl_chart/fl_chart.dart'; // 차트 임포트임 없으면 차트 못 그림ㅋㅋ

import 'dart:convert'; // json import

// 다우존스랑 나스닥 100 정보 가져올거임
Future <List<Map<String, dynamic>>> getStockData() async {
  // 정보 늦으니까 await, Future 쓰고 Json Map 자료니까 타입 선언도 같이해줘야 함

  // 다우존스랑 나스닥 심볼 적어놔야 부르지 ㅇㅈ?
  final symbol = {'다우존스' : '^DJI', '나스닥' : '^NDX'};

  // 데이터 가져올 때에는 여러가지 동시에
  return Future.wait(symbol.entries.map((name) async {
    // 1일 데이터 가져오기 name.value는 심볼의 티커 가져오는거임 ㅇㅇ
    var result = await http.get(Uri.parse('https://query1.finance.yahoo.com/v8/finance/chart/${name.value}?range=1d&interval=5m'));

    // null 체크해주래
    if (result.statusCode != 200) {
      print('오류나는디');
    }

    // jsondecode을 쓰는 이유는 json에서 데이터 내가 쓰려고 ㅋㅋ
    var data = jsonDecode(result.body)['chart']['result'][0];
    var prices = data['indicators']['quote'][0]['close'];
    // todo : 야후 파이낸스 api json 파일 양식 참고해서 추가적인 데이터 추가해야 함

    return {
      'symbol' : name.key, // 심볼 이름임 굳이 지금은 필요없는데, 혹시 몰라서 나중에 쓸거 같음
      'currentPrice' : prices.last, // 최근 가격 전날 가격임
      // todo : 차트 시각화하려고 아래는 복잡하게 구함
      'prices' :  ((prices.last - prices[prices.length - 2]) / prices[prices.length - 2]) * 100, // 최근 가격
      'changePercent' : List.generate(prices.length, (i) => FlSpot(i.toDouble(), prices[i]?.toDouble() ?? 0))
      // 등락률 계산, flospot은 x랑 y축
    // 리스트 생성: List.generate(prices.length, (i) => FlSpot(i.toDouble(), prices[i]?.toDouble() ?? 0))
    // prices.length는 배열의 길이로, 생성할 리스트의 요소 수를 정합니다.
    // i는 현재 인덱스, prices[i]는 해당 인덱스의 가격입니다.
    // i.toDouble()와 prices[i]?.toDouble() ?? 0는 각각 x축과 y축의 값으로 사용됩니다. 여기서 prices[i]?.toDouble()는 prices[i]가 null이 아니면 double로 변환, null이면 0을 반환합니다.
    };
  }));
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Map<String, dynamic>> stockData = []; // 주식 데이터를 저장할 리스트

  bool isLoading = true;
  // 로딩 상태 표시 왜냐하면 로딩 화면 띄울거라 ㅋㅋ

  @override
  void initState() {
    super.initState();
    // Future 데이터 콜백, 받으면 .then((data) => setState(()해서
    getStockData().then((data) =>
        setState(()
        {
          stockData = data; // 위에서 데이터 받았다?
          isLoading = false; // 데이터 로딩 완료하면댐 ㅋㅋ
        })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // 내용 많아질건데 미리 스크롤뷰 넣자잉
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox( height: 80 ),
              Text('대표 지수', style: TextStyle( fontSize: 20, color: Colors.black )),
              SizedBox( height: 20 ),
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    isLoading ?
                    Center(child: CircularProgressIndicator()) :
                    // 응 삼항연산자야
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 20,
                            offset: Offset(5, 5)
                          )
                        ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // toStringAsFixed 소수점 떼려고 씀
                          Text('${stockData[0]['symbol']} : ${stockData[0]['currentPrice'].toStringAsFixed(0)}'),

                          // 그래프
                          Container(
                            padding: EdgeInsets.all(5),
                            child: SizedBox(
                              width: 180,  // 차트 너비 설정
                              height: 80,  // 차트 높이 설정
                              child: LineChart(
                                  LineChartData(
                                      gridData: FlGridData(show: false),  // 격자 라인 안 보이게 설정
                                      titlesData: FlTitlesData(show: false),  // 축 제목 안 보이게 설정
                                      borderData: FlBorderData(show: false),  // 차트 테두리 안 보이게 설정
                                      lineBarsData: [
                                        LineChartBarData(
                                          spots: stockData[0]['changePercent'],  // 차트에 표시할 데이터
                                          isCurved: true,  // 선을 곡선으로 표시
                                          color: stockData[0]['changePercent'].first.y < stockData[0]['changePercent'].last.y ? Colors.red : Colors.blue,  // 선 색상은 시작 가격과 최종 가격 비교에 따라 결정
                                          barWidth: 2,  // 선 두께는 2
                                          dotData: FlDotData(show: false),  // 데이터 점 안 보이게 설정
                                          belowBarData: BarAreaData(show: false),  // 선 아래 영역 색칠 안 함
                                        )
                                      ]
                                  )
                              ),
                            ),
                          ),

                          // 변동성 나타내는 텍스트
                          Text(
                              '${(stockData[0]['changePercent'].last.y - stockData[0]['changePercent'].first.y).toStringAsFixed(2)}'
                                  '(${((stockData[0]['changePercent'].last.y - stockData[0]['changePercent'].first.y) / stockData[0]['changePercent'].first.y * 100).toStringAsFixed(2)}%)',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: (stockData[0]['changePercent'].last.y >= stockData[0]['changePercent'].first.y) ? Colors.red : Colors.blue
                              )
                          )


                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 20,
                                offset: Offset(5, 5)
                            )
                          ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('${stockData[1]['symbol']} : ${stockData[1]['currentPrice'].toStringAsFixed(0)}'),

                          SizedBox( height: 20 ),

                          Container(
                            padding: EdgeInsets.all(5),
                            child: SizedBox(
                              width: 180,
                              height: 80,
                              child: LineChart(
                                LineChartData(
                                  gridData: FlGridData(show: false), // 격자 제거
                                  titlesData: FlTitlesData(show: false), // 제목 제거
                                  borderData: FlBorderData(show: false), // 기타 외부 정보 제거
                                  // 데이터 들어가는 곳
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: stockData[1]['changePercent'], // 데이터 삽입하고
                                      isCurved: true, // 커브로 바꿔주고
                                      dotData: FlDotData(show: false), // 점 구질구질한거 안보이게 설정
                                      belowBarData: BarAreaData(show: false), // 선 아래 색칠 없애기
                                      barWidth: 2,
                                      color: stockData[1]['changePercent'].first.y < stockData[1]['changePercent'].last.y ? Colors.red : Colors.blue
                                    )
                                  ]
                                )
                              ),
                            ),
                          ),

                          Text(
                              '${(stockData[1]['changePercent'].last.y - stockData[1]['changePercent'].first.y).toStringAsFixed(2)}'
                                  '(${((stockData[1]['changePercent'].last.y - stockData[1]['changePercent'].first.y) / stockData[1]['changePercent'].first.y * 100).toStringAsFixed(2)}%)',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: (stockData[1]['changePercent'].last.y >= stockData[1]['changePercent'].first.y) ? Colors.red : Colors.blue
                              )
                          )


                        ],
                      ),
                    )
                  ],
                )
              )
            ],
          ),
        ),
      )
    );
  }
}
