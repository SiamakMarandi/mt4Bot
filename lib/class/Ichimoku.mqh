//+------------------------------------------------------------------+
//|                                                    Ichimoku .mqh |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql4.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql4.com"
#property version   "1.00"
#property strict
class Ichimoku
  {
private:
   string            symbol;
   int               ichimokuTimeframe;
   int               tenkan_senPeriod;
   int               kijun_senPeriod;
   int               senkou_span_bPeriod;
   int               tenkan_senMode;   
   int               kijun_senMode;
   int               chikou_spanMode;
   int               senkou_span_aMode;
   int               senkou_span_bMode;

public:
                     Ichimoku();

   double            tenkan_senLine(int tenkan_senShift);
   double            Kijun_senLine(int kijun_senShift);
   double            chikou_spanLine(int chikou_spanShift);
   double            senkou_span_aLine(int senkou_span_aShift);
   double            senkou_span_bLine(int senkou_spanbShift);

                    ~Ichimoku();
  };
//+------------------------------------------------------------------+
//|                                                |
//+------------------------------------------------------------------+
Ichimoku ::Ichimoku()
  {
   symbol = NULL;
   ichimokuTimeframe = 0;
   tenkan_senPeriod = 9;
   kijun_senPeriod = 26;
   senkou_span_bPeriod = 52;
   tenkan_senMode = 1;
   kijun_senMode = 2;
   chikou_spanMode = 5;
   senkou_span_aMode = 3;
   senkou_span_bMode = 4;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Ichimoku ::~Ichimoku()
  {
  }
//+------------------------------------------------------------------+
//|                             Tenkan-sen line                      |
//+------------------------------------------------------------------+
double Ichimoku::tenkan_senLine(int tenkan_senShift)
  {

   return iIchimoku(symbol, ichimokuTimeframe, tenkan_senPeriod, kijun_senPeriod, senkou_span_bPeriod, tenkan_senMode, tenkan_senShift);

  }
//+------------------------------------------------------------------+
//|                            Kijun-sen line                        |
//+------------------------------------------------------------------+
double Ichimoku::Kijun_senLine(int kijun_senShift)
  {

   return iIchimoku(symbol, ichimokuTimeframe, tenkan_senPeriod, kijun_senPeriod, senkou_span_bPeriod, tenkan_senMode, kijun_senShift);

  }
//+------------------------------------------------------------------+
//|                           Chikou span line                       |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ichimoku::chikou_spanLine(int chikou_spanShift)
  {

   return iIchimoku(symbol, ichimokuTimeframe, tenkan_senPeriod, kijun_senPeriod, senkou_span_bPeriod, chikou_spanMode, chikou_spanShift);

  }

//+------------------------------------------------------------------+
//|                            Senkou span A line                    |
//+------------------------------------------------------------------+
double Ichimoku::senkou_span_aLine(int senkou_span_aShift)
  {

   return iIchimoku(symbol, ichimokuTimeframe, tenkan_senPeriod, kijun_senPeriod, senkou_span_bPeriod, senkou_span_aMode, senkou_span_aShift);

  }


//+------------------------------------------------------------------+
//|                             Senkou span B line                                      |
//+------------------------------------------------------------------+
double Ichimoku::senkou_span_bLine(int senkou_span_bShift)
  {

   return iIchimoku(symbol, ichimokuTimeframe, tenkan_senPeriod, kijun_senPeriod, senkou_span_bPeriod, senkou_span_bMode, senkou_span_bShift);

  }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
