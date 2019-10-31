
import 'package:exam/DataInfo/CounterClass.dart';

class CounterList
{
    List<Counter> _listCounters = [
      Counter(count: 3, word: "lo peta", )
    ];

    int GetNumberCounters() => _listCounters.length;

    Counter GetCounterByIndex(int i) => _listCounters[i];

    void AddCounter(Counter count) => _listCounters.add(count);

    void ResetAllCounters()
    {
      for(int i = 0; i < GetNumberCounters(); ++i)
      {
        _listCounters[i].count = 0;
      }
    }
}