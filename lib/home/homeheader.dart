import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:upstock/shimmer/homeheadershimmer.dart'; // 차트 임포트임 없으면 차트 못 그림ㅋㅋ

// 슬라이더
import 'package:carousel_slider/carousel_slider.dart';

class HomeHeader extends StatefulWidget {
  final Future<List<Map<String, dynamic>>> Function() getStockData;
  final List<Map<String, dynamic>> stockData;

  const HomeHeader(
      {super.key, required this.stockData, required this.getStockData});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  // 로딩 체크
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    shimmerLoading();
  }

  // 홈 부모꺼 가져와서 막씀
  shimmerLoading() async {
    try {
      // 가져와서
      var result = await widget.getStockData();
      // todo 이거 마운티드 안써서 빨리하면 오류남 z < 넣어도 오류나네
      if (mounted) {
        setState(() {
          // 몰래 저장하고 로딩 끝내기 ㅋㅋㅋ
          widget.stockData.addAll(result);
          isLoading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
      children: [
        SizedBox(height: 70),

        Row(
          children: [
            SizedBox(width: 20),
            Text('대표 지수',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ],
        ),

        // 대표 지수랑 슬라이더 사이 간격
        SizedBox(height: 20),

        // slider 위치
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            autoPlay: false,
            viewportFraction: 1.0,
          ),
          items: [
            isLoading
                ? Homeheadershimmer()
                : StockCard(stockData: widget.stockData[0]),
            isLoading
                ? Homeheadershimmer()
                : StockCard(stockData: widget.stockData[1]),
          ],
        ),

        SizedBox(height: 40),

        Row(
          children: [
            SizedBox(width: 20),
            Text('인기 커뮤니티',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),

          ],
        ),
      ],
    ));
  }
}

// 카드뷰 통합 관리
class StockCard extends StatelessWidget {
  // Map<String, dynamic>과 required를 사용하는 이유는 타입 명확하게 지정해서 성능 향상, required 사용해서 null 방지
  final Map<String, dynamic> stockData;

  const StockCard({super.key, required this.stockData});

  @override
  Widget build(BuildContext context) {
    return Container(
      // 동적 배치
      width: MediaQuery.of(context).size.width*0.9,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black
        )
      ),
      child: Column(
        children: [
          // toStringAsFixed 소수점 떼려고 씀
          Text(
              '${stockData['symbol']} : ${stockData['currentPrice'].toStringAsFixed(0)}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      
          SizedBox(height: 20),
      
          // 그래프
          SizedBox(
            height: 100, // 차트 높이 설정
            child: LineChart(LineChartData(
                // 사용자가 마우스 위에 올렸을 때 주가 나오는 부분 삭제
                lineTouchData: LineTouchData(enabled: false),
                gridData: FlGridData(show: false),
                // 격자 라인 안 보이게 설정
                titlesData: FlTitlesData(show: false),
                // 축 제목 안 보이게 설정
                borderData: FlBorderData(show: false),
                // 차트 테두리 안 보이게 설정
                lineBarsData: [
                  LineChartBarData(
                    spots: stockData['changePercent'],
                    // 차트에 표시할 데이터
                    isCurved: true,
                    // 선을 곡선으로 표시
                    color: stockData['changePercent'].first.y <
                            stockData['changePercent'].last.y
                        ? Colors.red
                        : Colors.blue,
                    // 선 색상은 시작 가격과 최종 가격 비교에 따라 결정
                    barWidth: 1.5,
                    // 선 두께는 2
                    dotData: FlDotData(show: false),
                    // 데이터 점 안 보이게 설정
                    belowBarData: BarAreaData(show: false), // 선 아래 영역 색칠 안 함
                  )
                ])),
          ),
      
          SizedBox(height: 20),
          // 변동성 나타내는 텍스트
          Text(
              '${(stockData['changePercent'].last.y - stockData['changePercent'].first.y).toStringAsFixed(2)}'
              '(${((stockData['changePercent'].last.y - stockData['changePercent'].first.y) / stockData['changePercent'].first.y * 100).toStringAsFixed(2)}%)',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: (stockData['changePercent'].last.y >=
                          stockData['changePercent'].first.y)
                      ? Colors.red
                      : Colors.blue)),
        ],
      ),
    );
  }
}
