//+------------------------------------------------------------------+
//|                                                   indicators.mqh |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
class Indicators
  {
private:
   //-----------------------stochastic
   string            symbol;
   int               stochasticTimeframe;
   int               stochasticMethod;
   int               price_field;
   int               stochasticBaseIndicatorLineMode;
   int               stochastiSignalLineMode;
   //---------------------------ADX
   int               adxTimeframe;
   int               adxAppliedPrice;
   int               adxBaseIndicatorLineMode;
   int               adxPlusDIIndicatorLineMode;
   int               adxMinusDIIndicatorLineMode;
   //----------------------------Parapolic Sar
   int               pSarTimeframe;
   //-----------------------------Money Flow Index
   int               mfiTimeframe;
   //-----------------------------Moving Average
   int               maTimeframe;
   int               maMethod;
   int               maAppliedPrice;
   //-------------------------------MACD
   int               macdBaseIndicatorLineMode;
   int               macdSignalLineMode;
   int               macdTimeframe;
   int               macdAppliedPrice;
   //------------------------------------Commodity Channel Index indicator
   int               cciAppliedPrice;
   int               cciTimeframe;
   //---------------------------------------------------------Momentum
   int               momentumAppliedPrice;
   int               momentumTimeframe;

public:
                     Indicators(void);

   double            parapolicSarIndicator(double step, double maxStep, int pSarShift);

   double            adxBaseIndicatorLine(int adxPeriod, int adxShift);

   double            adxPlusDIIndicatorLine(int adxPeriod, int adxShift);

   double            adxMinusDIIndicatorLine(int adxPeriod, int adxShift);

   double            movingAverageIndicator(int maPeriod, int maShift, int shift);

   double            moneyFlowIndexIndicator(int mfiPeriod, int mfiShift);

   double            commodityChannelIndexIndicator(int cciPeriod, int cciShift);

   double            momentumIndicator(int momentumPeriod, int momentumShift);

   double            stochasticOscillatorBaseIndicatorLine(int KPeriod, int dPeriod, int slowing, int stochasticShift);

   double            stochasticOscillatorSignalLine(int KPeriod, int dPeriod, int slowing, int stochasticShift);

   double            macdOscillatorBaseIndicatorLine(int macdFastEmaPeriod, int macdSlowEmaPeriod,int macdSignalPeriod, int macdShift);

   double            macdOscillatorSignalLine(int macdFastEmaPeriod, int macdSlowEmaPeriod,int macdSignalPeriod, int macdShift);

   double            zigzagIndicator(int zigzagShift);

   double            rocOscillator(int rocShift);

                    ~Indicators();
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Indicators::Indicators(void)
  {
//-------------Stochastic
   symbol = NULL;
   stochasticTimeframe = 0;
   stochasticMethod = 0;
   price_field = 0;
   stochasticBaseIndicatorLineMode = 0;
   stochastiSignalLineMode = 1;
//---------------------Adx
   adxTimeframe = 0;
   adxAppliedPrice = 2;
   adxBaseIndicatorLineMode = 0;
   adxPlusDIIndicatorLineMode = 1;
   adxMinusDIIndicatorLineMode = 2;
//---------------Parapolic Sar
   pSarTimeframe = 0;
//----------------------Money Flow Index
   mfiTimeframe = 0;
//-------------------------------Moving Average
   maTimeframe = 0;
   maMethod = 1;
   maAppliedPrice = 0;
//---------------------------MACD
   macdBaseIndicatorLineMode = 0;
   macdSignalLineMode = 1;
   macdTimeframe = 0;
   macdAppliedPrice = 0;
///---------------------------------------------Commodity Channel Index indicator
   cciAppliedPrice = 0;
   cciTimeframe = 0;
///---------------------------------------------Momentum indicator
   momentumAppliedPrice = 0;
   momentumTimeframe = 0;


  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Indicators::~Indicators()
  {
  };


//+------------------------------------------------------------------+
//|       Parabolic Sar
//+------------------------------------------------------------------+
double Indicators::parapolicSarIndicator(double step, double maxStep, int pSarShift)

  {

   return iSAR(symbol, pSarTimeframe, step, maxStep, pSarShift);

  }
//+------------------------------------------------------------------+
//|      Average Directional Movement Index indicator
//+------------------------------------------------------------------+
double Indicators::adxBaseIndicatorLine(int adxPeriod,int adxShift)
  {

   return iADX(symbol, adxTimeframe, adxPeriod, adxAppliedPrice, adxBaseIndicatorLineMode, adxShift);

  }
//+------------------------------------------------------------------+
//|         verage Directional Movement Index +DI indicator          |
//+------------------------------------------------------------------+
double Indicators::adxPlusDIIndicatorLine(int adxPeriod, int adxShift)
  {

   return iADX(symbol, adxTimeframe, adxPeriod, adxAppliedPrice, adxPlusDIIndicatorLineMode, adxShift);

  }
//+------------------------------------------------------------------+
//|             verage Directional Movement Index -DI indicator      |
//+------------------------------------------------------------------+
double Indicators::adxMinusDIIndicatorLine(int adxPeriod, int adxShift)
  {

   return iADX(symbol, adxTimeframe, adxPeriod, adxAppliedPrice, adxMinusDIIndicatorLineMode, adxShift);

  }
//+------------------------------------------------------------------+
//|         Moving Average indicator
//+------------------------------------------------------------------+
double Indicators::movingAverageIndicator(int maPeriod, int maShift, int shift)
  {

   return iMA(symbol, maTimeframe, maPeriod, maShift, maMethod, maAppliedPrice,  shift);

  }

//+------------------------------------------------------------------+
//|           Money Flow Index indicator
//+------------------------------------------------------------------+
double Indicators::moneyFlowIndexIndicator(int mfiPeriod, int mfiShift)
  {

   return iMFI(symbol, mfiTimeframe, mfiPeriod, mfiShift);

  }


//+------------------------------------------------------------------+
//|                      Stochastic Ocilator Base Line
//+------------------------------------------------------------------+
double Indicators::stochasticOscillatorBaseIndicatorLine(int KPeriod, int DPeriod, int slowing, int stochasticShift)
  {

   return iStochastic(symbol, stochasticTimeframe, KPeriod, DPeriod, slowing, stochasticMethod, price_field, stochasticBaseIndicatorLineMode, stochasticShift);

  }

//+------------------------------------------------------------------+
//|                  Stochastic Ocilator Signal Line
//+------------------------------------------------------------------+
double Indicators::stochasticOscillatorSignalLine(int KPeriod, int DPeriod, int slowing, int stochasticShift)
  {

   return iStochastic(symbol, stochasticTimeframe, KPeriod, DPeriod, slowing, stochasticMethod, price_field, stochastiSignalLineMode, stochasticShift);

  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                  MACD Ocilator Base Line
//+------------------------------------------------------------------+
double Indicators::macdOscillatorBaseIndicatorLine(int macdFastEmaPeriod, int macdSlowEmaPeriod,int macdSignalPeriod, int macdShift)
  {

   return iMACD(symbol, macdTimeframe, macdFastEmaPeriod, macdSlowEmaPeriod, macdSignalPeriod, macdAppliedPrice, macdBaseIndicatorLineMode, macdShift);

  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                  MACD Ocilator Signal line
//+------------------------------------------------------------------+
double Indicators::macdOscillatorSignalLine(int macdFastEmaPeriod, int macdSlowEmaPeriod,int macdSignalPeriod, int macdShift)
  {

   return iMACD(symbol, macdTimeframe, macdFastEmaPeriod, macdSlowEmaPeriod, macdSignalPeriod, macdAppliedPrice, macdSignalLineMode, macdShift);

  }
//+------------------------------------------------------------------+
//|                  Commodity Channel Index indicator
//+------------------------------------------------------------------+
double Indicators::commodityChannelIndexIndicator(int cciPeriod, int cciShift)
  {

   return iCCI(symbol, cciTimeframe, cciPeriod, cciAppliedPrice, cciShift);

  }
//+------------------------------------------------------------------+
//|                 Momentum indicator
//+------------------------------------------------------------------+
double Indicators::momentumIndicator(int momentumPeriod, int momentumShift)
  {

   return iCCI(symbol, momentumTimeframe, momentumPeriod, momentumAppliedPrice, momentumShift);

  }
//+------------------------------------------------------------------+
//|                 Zigzag indicator
//+------------------------------------------------------------------+
double Indicators::zigzagIndicator(int zigzagShift)

  {

   return iCustom(NULL,0,"ZigZag", InpDepth, InpDeviation, InpBackstep, 1, zigzagShift);

  }
//+------------------------------------------------------------------+
//|                 Price Rate Of Change                              |
//+------------------------------------------------------------------+
double Indicators::rocOscillator(int rocShift)
  {

   return iCustom(NULL,0,"roc", 0, rocShift);

  }
//+------------------------------------------------------------------+
