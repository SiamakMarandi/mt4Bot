//+------------------------------------------------------------------+
//|                                                  initializer.mqh |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql4.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql4.com"
#property version   "1.00"
#property strict

#include <..\billWilliams.mqh>

#include <..\Ichimoku.mqh>

BillWilliams billWilliams;

Ichimoku ichimoku;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Initializer : public Indicators
  {
public:

public:
                     Initializer();
   void              fillerIndicators(void);
                    ~Initializer();
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Initializer::Initializer()
  {
//---------------------------Moving Average
   maFastPeriod = 10;
   maMediumPeriod = 20;
   maSlowPeriod = 40;
   maVerySlowPeriod = 80;
//------------------------------ADX
   adxMaxValue = 20;
//------------------------------CCI


  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Initializer::~Initializer()
  {
  }
//+------------------------------------------------------------------+
void Initializer::fillerIndicators(void)
  {

// maFast = movingAverageIndicator(maFastPeriod,0,0);
//
// maMedium = movingAverageIndicator(maMediumPeriod,0,0);
//
//  maSlow = movingAverageIndicator(maSlowPeriod,0,0);
//
//   maVerySlow = movingAverageIndicator(maVerySlowPeriod,0,0);
//
   adx  = adxBaseIndicatorLine(14, 0);
//
   adxPlusDI = adxPlusDIIndicatorLine(14, 0);
//
   adxMinusDI = adxMinusDIIndicatorLine(14, 0);
//
//   pSar =  parapolicSarIndicator(0.007,0.2,0);
//
  // mfi = moneyFlowIndexIndicator(14, 0);
//
//   cci = commodityChannelIndexIndicator(14, 0);
//
//   momentum =  momentumIndicator(14, 0);
//
//   stochastic = stochasticOscillatorBaseIndicatorLine(5, 3, 3, 0);
//
//   stochasticSignal = stochasticOscillatorSignalLine(5, 3, 3, 0);
//
  // macd = macdOscillatorBaseIndicatorLine(12, 26, 9, 0);
//
//   macdSignal = macdOscillatorSignalLine(12, 26, 9, 0);
//
//   bwmfi = billWilliams.marketFacilitationIndexIndicator(0);
//
//   bwao = billWilliams.awesomeOscillato(0);
//
//   bwgu = billWilliams.gatorUpperLineOscillator(13, 8, 8, 5, 5, 3, 0);
//
//   bwgl = billWilliams.gatorLowerLineOscillator(13, 8, 8, 5, 5, 3, 0);
//
//   bwalligj = billWilliams.alligatorJawLineIndicator(13, 8, 8, 5, 5, 3, 0);
//
//   bwalligt = billWilliams.alligatorTeethLineIndicator(13, 8, 8, 5, 5, 3, 0);
//
//   bwalligl = billWilliams.alligatorLipsLineIndicator(13, 8, 8, 5, 5, 3, 0);
//
//   tenkan_sen = ichimoku.tenkan_senLine(0);
//
//   kijun_sen = ichimoku.Kijun_senLine(0);
//
//   chikou_span = ichimoku.chikou_spanLine(0);
//
//   senkou_span_a = ichimoku.senkou_span_aLine(0);
//
//   senkou_span_b = ichimoku.senkou_span_bLine(0);
//
//  zigzagVal = zigzagIndicator(0);
//
//   roc = roc.rocVal(0);


  }
//+------------------------------------------------------------------+
