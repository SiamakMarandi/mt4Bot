//+------------------------------------------------------------------+
//|                                                     aligator.mq4 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "21.00"
#property strict

#include <..\lib\entry_point.mqh>
#include <..\lib\exit_point.mqh>
#include <..\lib\class\Order.mqh>
#include <..\lib\class\Initializer.mqh>
#include <..\lib\class\EntryConditions.mqh>
#include <..\lib\class\Fractals.mqh>
//============================================================
input double lot = 0.1;         //=0.04;
//input double MaximumRisk   =0.02;
//input double DecreaseFactor=3;
//--------------------------------------------------------------- 2 --
extern int History    =5000;        //
extern int Period_MA_1=21;          //
extern int Bars_V     =13;          //
extern int Aver_Bars  =5;           //
//--------------------------------------------------------------- 3 --

input int MovingShift = 0;//30
input double stopLoss = -15;//25
input double takeProfit = 3;
input int InpDepth = 12;
input int InpDeviation = 5;
input int InpBackstep = 3;

extern int MagicBuy=1111;
extern int MagicSell=2222;
extern bool UseTrStopo=true;
extern double TrailingStop=20;

extern int orderTickets;
extern double closePrice = 0;

extern int order_type = 0;
extern int ticketNumber = 0;

extern bool orderClosed ;
extern string orderFlag;

extern int flagCounter = 0;
extern int maxFlagCounter = 3;
extern datetime LastActiontime;

extern double maFast;
//---------------------------Moving Average
extern int maFastPeriod;
extern int maMediumPeriod;
extern int maSlowPeriod;
extern int maVerySlowPeriod;

extern double maMedium;
extern double maSlow;
extern double maVerySlow;
//------------------------------ADX
extern int    adxMaxValue;
extern double adx;
extern double adxPlusDI;
extern double adxMinusDI;
//------------------------------Comodity Channel Index
extern double cci;
//------------------------------MACD
extern double macdSignal;
extern double macd;
//------------------------------Stochastic
extern double stochasticSignal;
extern double stochastic;
//------------------------------Money flow index
extern double mfi;
//---------------------------------Momentum
extern double momentum;
//-----------------------------------Parabolic Sar
extern double pSar;
//----------------------------------------------Bill Williams
extern double bwmfi;

extern double  bwao;

extern double bwgu;

extern double bwgl;

extern double bwalligj;

extern double bwalligt;

extern double bwalligl;
//---------------------------------------------------------Ichimoku
extern double tenkan_sen;

extern double kijun_sen;

extern double chikou_span;

extern double senkou_span_a;

extern double senkou_span_b;

//---------------------------------------------------------Zigzag

extern double zigzagVal;

//----------------------------------------------------- Bollinger Band

extern double boliberMain;

extern double bolingerUpper;

extern double bolingerLower;

//--------------------------------------------------------

extern int candleFlag = 0;

extern double m = 0;
//======================================================================

//#include <..\lib\Indicators.mqh>
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {

//---

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---

   double yLine = 0.0, mLine = 0.0;

//  Order order;
   Fractals fractals;
   Initializer initializer;
   Candles candle;
//EntryConditions entryConditions;

   initializer.fillerIndicators();
//    Print("Total number of bars for the symbol-period at this moment = ",
//      SeriesInfoInteger(Symbol(),0,SERIES_BARS_COUNT));



   if(LastActiontime!=Time[0])

     {
      // Print("candle averageBody : ", candle.averageBdoyCandle(0, 100));
      Comment("Ask = ",Ask,"\n","Bid = ",Bid,"\n","Bars = ",Bars,"\n","Digits = ",Digits,"\n","Point = ",Point,"\n", "Account Free Margin = ", AccountFreeMargin(),"\n", "OrdersTotal = ", OrdersTotal());


      //  iCustom(NULL, 0,"iScoring", 0, 0);

      if(GetLastError() == 134 || GetLastError() == 138)
        {

         ExpertRemove();

        }

      if(OrdersTotal() == 0)
        {

         if(buyCommandOrder())
           {
            //printf("---------BuyOrder()----------------------");

            //int tiketbuy=OrderSend(Symbol(),OP_BUY,lot,Ask,5,Ask-(stopLoss*Point),Ask+(takeProfit*Point),"Yoda Group",MagicBuy,0,clrGreen);

            order.buyOrder();
            // entryConditions.enterCondition();
            fractals.mUpperFractal();
           }//buy if

         if(sellCommandOrder())
           {

            // printf("---------SellOrder()----------------------");
            //int tiketsell=OrderSend(Symbol(),OP_SELL,lot,Bid,5,Bid+(stopLoss*Point),Bid-(takeProfit*Point),"Yoda Group",MagicSell,0,clrRed);

            order.sellOrder();

           }//sell if


        }//OrdersTotal
      else
        {

         if(exitCommandOrder())
           {

            if(OrderSelect(0,SELECT_BY_POS,MODE_TRADES))
              {
               //   printf("exitCommandOrder() triggered!!!!!!!!!!!!!!!!!");
               order.closeOrder();

              }//alligator
           }
         //         if(OrderSelect(0,SELECT_BY_POS,MODE_TRADES))
         //           {
         //            // order.orderTrailingStopLoss();
         //            printf("HELLO");
         //
         //           }//trailing
         // order.orderTrailingStopLoss();

         order_type=OrderType();
         if(order_type == 0)
           {

            yLine = fractals.yBuyFractal(candleFlag);

            if(Open[1] <= Close[1])
              {

               if(yLine > Open[1] && yLine < Close[1])

                  order.closeOrder();

               else
                  return;

              }

            else

              {

               if(yLine < Open[1] && yLine > Close[1])

                  order.closeOrder();

               else

                  return;

              }

            candleFlag = candleFlag + 1;

           }
         else
           {

            yLine = fractals.ySellFractal(candleFlag);

            if(Open[1] <= Close[1])
              {

               if(yLine > Open[1] && yLine < Close[1])

                  order.closeOrder();

               else
                  return;

              }

            else

              {

               if(yLine < Open[1] && yLine > Close[1])

                  order.closeOrder();

               else

                  return;

              }

            candleFlag = candleFlag + 1;

           }





        } //else OrdersTotal


      LastActiontime=Time[0];

     }// if(LastActiontime!=Time[0])

   if(OrderSelect(0,SELECT_BY_POS,MODE_TRADES))
     {

      if(OrderProfit() <= stopLoss || OrderProfit() >= takeProfit)

        {

         printf("==========StopLoss Trigered");
         order.closeOrder();

        }

     }

  }//onTick
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
