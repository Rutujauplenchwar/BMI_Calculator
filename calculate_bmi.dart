
import 'dart:math';

class CalculatorBrain
{
  CalculatorBrain({ required this.height , required this.weight});
  final int height;
  final int weight;
  double _bmi = 0;
  String result()
  {
     _bmi = weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getMess1()
  {
    if(_bmi>= 25)
    {
      return 'Overweight';
    }
    else if(_bmi >= 18.5)
    {
        return 'Normal';
    }
    else
    {
      return 'Underweight';
    }
  }


String getMess2()
{
  if(_bmi>= 25)
    {
      return 'You have a higher than a normal body weight. Try to exercise more.';
    }
    else if(_bmi >= 18.5)
    {
        return 'You have a normal body weight. Good Job!';
    }
    else
    {
      return 'You have a lower than a normal body weight. You can eat a bit more.';
    }

}

}
