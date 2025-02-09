import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';

// ✅ Yahoo Finance에서 다우존스 & 나스닥 100 데이터 가져오기
Future<List<Map<String, dynamic>>> fetchStockData() async {
  final symbols = {"DOW JONES": "^DJI", "NASDAQ 100": "^NDX"}; // 다우존스 & 나스닥 100 심볼 설정

  // 여러 API 요청을 동시에 처리 (비동기 병렬 실행)
  return Future.wait(symbols.entries.map((entry) async {
    final res = await http.get(Uri.parse('https://query1.finance.yahoo.com/v8/finance/chart/${entry.value}?range=5d&interval=1d'));
    if (res.statusCode != 200) return {}; // 요청 실패 시 빈 데이터 반환

    final data = jsonDecode(res.body)['chart']['result'][0]; // JSON 파싱
    final prices = data['indicators']['quote'][0]['close']; // 주가 데이터 가져오기

    return {
      "symbol": entry.key, // 주식 이름 (다우존스 or 나스닥 100)
      "currentPrice": prices.last, // 현재 가격
      "changePercent": ((prices.last - prices[prices.length - 2]) / prices[prices.length - 2]) * 100, // 변동률(%)
      "prices": List.generate(prices.length, (i) => FlSpot(i.toDouble(), prices[i]?.toDouble() ?? 0)) // 차트용 데이터 변환
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
  bool isLoading = true; // 로딩 상태 관리

  @override
  void initState() {
    super.initState();
    fetchStockData().then((data) => setState(() { // 비동기 데이터 가져오기
      stockData = data;
      isLoading = false; // 데이터 로딩 완료
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          SizedBox(height: 80),
          Text('Stock Market Overview', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), // 제목
          SizedBox(height: 30),
          isLoading
              ? Center(child: CircularProgressIndicator()) // 로딩 중이면 로딩 표시
              : Row( // 데이터를 가로로 2개 배치
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: stockData.map((data) => Expanded(child: StockTile(data))).toList(),
          ),
        ]),
      ),
    );
  }
}

// ✅ 개별 주식 정보를 표시하는 위젯
class StockTile extends StatelessWidget {
  final Map<String, dynamic> data; // 주식 데이터
  const StockTile(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8), // 간격 설정
      padding: EdgeInsets.all(16), // 내부 패딩 설정
      decoration: BoxDecoration(
        color: Colors.white, // 배경색 흰색
        borderRadius: BorderRadius.circular(10), // 둥근 테두리
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5)], // 그림자 효과
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(data["symbol"], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), // 주식 이름
        Text("\$${data["currentPrice"].toStringAsFixed(2)}", style: TextStyle(fontSize: 16, color: Colors.black54)), // 현재 가격

        // 🔹 미니 라인 차트 표시
        SizedBox(
          width: double.infinity,
          height: 40,
          child: LineChart(LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: data["prices"], // 차트 데이터
                isCurved: true, // 부드러운 곡선
                color: data["changePercent"] >= 0 ? Colors.blue : Colors.red, // 상승(파랑), 하락(빨강)
                barWidth: 2,
                belowBarData: BarAreaData(show: false),
                dotData: FlDotData(show: false),
              )
            ],
            titlesData: FlTitlesData(show: false), // 축 제목 숨김
            borderData: FlBorderData(show: false), // 테두리 숨김
            gridData: FlGridData(show: false), // 격자 숨김
          )),
        ),

        // 🔹 변동률(%)
        Text("${data["changePercent"].toStringAsFixed(2)}%",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: data["changePercent"] >= 0 ? Colors.blue : Colors.red)),
      ]),
    );
  }
}
