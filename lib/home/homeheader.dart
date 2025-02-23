import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:shimmer/shimmer.dart'; // 차트 임포트임 없으면 차트 못 그림ㅋㅋ

class HomeHeader extends StatelessWidget {

  final List<Map<String, dynamic>> stockData;

  const HomeHeader({super.key, required this.stockData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox( height: 80 ),

        // todo : 사이즈 박스 없앨 수 있으면 없애보기 코드 더럽다
        Row(
          children: [
            SizedBox( width: 10 ),
            Text('대표 지수', style: TextStyle( fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold )),
          ],
        ),

        // 대표 지수랑 카드뷰 사이 간격
        SizedBox( height: 20 ),

        // 카드뷰 파트 시작점
        SizedBox(
            height: 170,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // todo : 이거 로딩 shimmer로 변경해야 함 + 작동되는지도 체크해야 함
                // todo : null 체크해야 하는데, 함수나 위젯으로 만들어서 통합 관리할지 정해야 함


                // 응 삼항연산자 위치야
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all( color: Colors.grey[300]! ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0.1,
                        )
                      ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // toStringAsFixed 소수점 떼려고 씀
                      Text('${stockData[0]['symbol']} : ${stockData[0]['currentPrice'].toStringAsFixed(0)}',
                          style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18 )),

                      // 그래프
                      Container(
                        padding: EdgeInsets.all(5),
                        child: SizedBox(
                          width: 140,  // 차트 너비 설정
                          height: 65,  // 차트 높이 설정
                          child: LineChart(
                              LineChartData(
                                // 사용자가 마우스 위에 올렸을 때 주가 나오는 부분 삭제
                                lineTouchData: LineTouchData(
                                  enabled: false
                                ),
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
                      border: Border.all( color: Colors.grey[300]! ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0.1,
                        )
                      ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('${stockData[1]['symbol']} : ${stockData[1]['currentPrice'].toStringAsFixed(0)}',
                          style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18 )),

                      Container(
                        padding: EdgeInsets.all(5),
                        child: SizedBox(
                          width: 140,
                          height: 65,
                          child: LineChart(
                              LineChartData(
                                // 사용자가 마우스 위에 올렸을 때 주가 나오는 부분 삭제
                                lineTouchData: LineTouchData(
                                    enabled: false
                                ),
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
        ),
      ],
    );
  }
}


// Shimmer Effect 위젯
class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ShimmerCard(),
              ShimmerCard(),
            ],
          ),
      )
    );
  }
}

// Shimmer Card 위젯
class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[300]!)
      ),
    );
  }
}