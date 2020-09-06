//+------------------------------------------------------------------+
//|                                                      Candles.mqh |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql4.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql4.com"
#property version   "1.00"
#property strict
class Candles
  {
private:

public:
                     Candles();
   double            shadowUpper(int i);
   double            shadowLower(int i);
   double            body(int i);
   double            length(int i);
   bool              candleLong(int i);
   bool              bearish(int i);
   bool              bulish(int i);
   bool              shadowLongLower(int i);
   bool              bearishEngulfing(int i);
   bool              bulishEngulfing(int i);
   bool              darkCloudCover(int i);
   bool              haramiCrossPattern(int i);
   bool              longLeggedDoji(int i);
   bool              dragonflyDoji(int i);
   bool              gravestoneDoji(int i);
   bool              fallingThreeMethod(int i);
   bool              rasingThreeMethod(int i);
   bool              bulishBeltHoldLine(int i);
   bool              tweezersBottom(int i);
   bool              tweezersTop(int i);
   bool              haramiPattern(int i);
   bool              shadowLongUpper(int i);
   bool              eveningStar(int i);
   bool              morningStar(int i);
   bool              piercingPattern(int i);
   bool              dojiCandle(int i);
   double            averageBdoyCandle(int begin, int end);
   bool              starCandle(int i);
                    ~Candles();
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Candles::Candles()
  {

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Candles::~Candles()
  {
  }
//+------------------------------------------------------------------+
//|                     Bulish candle                             |
//+------------------------------------------------------------------+
bool Candles::bulish(int i)
  {

   if(Open[i] < Close[i])

     {

      //     Print("candle is bulish");

      return true;

     }

   else

      return false;

  }
//+------------------------------------------------------------------+
//|                     Bearish candle                             |
//+------------------------------------------------------------------+
bool Candles::bearish(int i)
  {

   if(Open[i] > Close[i])

     {

      //     Print("candle is bearish");

      return true;

     }

   else

      return false;

  }
//+------------------------------------------------------------------+
//|                     big candle                             |
//+------------------------------------------------------------------+
bool Candles::candleLong(int i)
  {

   double bodyVal = 0;

   bodyVal = MathAbs(Close[i] - Open[i]);

   if(bodyVal >= 0.00026)

     {

      return true;

     }

   else

      return false;

  }


//+------------------------------------------------------------------+
//|                    Shadow Upper                                   |
//+------------------------------------------------------------------+
double Candles::shadowUpper(int i)
  {

   if(Open[i] >= Close[i])

      return High[i] - Open[i];

   else

      return High[i] - Close[i];

  }
//+------------------------------------------------------------------+
//|                   Shadow Lower                                   |
//+------------------------------------------------------------------+
double Candles::shadowLower(int i)
  {

   if(Open[i] >= Close[i])

      return Close[i] - Low[i];

   else

      return Open[i] - Low[i];

  }
//+------------------------------------------------------------------+
//|               Length of candle                                                   |
//+------------------------------------------------------------------+
double Candles::length(int i)
  {

   return High[i] - Low[i];

  }
//+------------------------------------------------------------------+
//|                  Body Candle                                     |
//+------------------------------------------------------------------+
double Candles::body(int i)
  {



   return MathAbs(Close[i] - Open[i]);

  }
//+------------------------------------------------------------------+
//|                  star Candle                                     |
//+------------------------------------------------------------------+
bool Candles::starCandle(int i)
  {

   double bodyVal = MathAbs(Close[i] - Open[i]);

   if(
      bodyVal <= 0.00006
      && bodyVal >= 0.00001
      && shadowUpper(i) <= bodyVal
      && shadowLower(i) <= bodyVal
   )

     {

      //   Print("candle is star candle");
      //ObjectCreate(0,"STAR",OBJ_ARROW_UP,0,0,0);
      //ObjectSetInteger(0,"STAR", OBJPROP_COLOR, clrBlueViolet);
      //ObjectSetInteger(0, "STAR", OBJPROP_STYLE, STYLE_SOLID);

      return true;

     }

   else

      return false;

  }
//+------------------------------------------------------------------+
//|                  Doji Candle                                     |
//+------------------------------------------------------------------+
bool Candles::dojiCandle(int i)
  {

   double bodyVal = MathAbs(Close[i] - Open[i]);

   if(bodyVal < 0.00001)

     {

      Print("candle is star candle");
      //ObjectCreate(0,"STAR",OBJ_ARROW_UP,0,0,0);
      //ObjectSetInteger(0,"STAR", OBJPROP_COLOR, clrBlueViolet);
      //ObjectSetInteger(0, "STAR", OBJPROP_STYLE, STYLE_SOLID);

      return true;

     }

   else

      return false;

  }
//+------------------------------------------------------------------+
//|                  Average Candle                                     |
//+------------------------------------------------------------------+
double Candles::averageBdoyCandle(int begin, int end)
  {
   double bodyCandle = 0.0;

   double body1;

   int i = 0;

   for(i = begin ; i < end ; i++)
     {

      body1 = MathAbs(Close[i] - Open[i]);

      bodyCandle = body1 +bodyCandle;

     }




   return bodyCandle / i;

  }

//+------------------------------------------------------------------+
//|                     Rversal patterns                             |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                    Hanging Man                                   |
//+------------------------------------------------------------------+
bool Candles::shadowLongLower(int i)
  {

   double lowerShadow;

   double bodyVal = MathAbs(Close[i] - Open[i]);

   if(Open[i] > Close[i])
     {

      lowerShadow = Close[i] - Low[i];

     }
   else

      lowerShadow = Open[i] - Low[i];

   if(bodyVal <= 0.00006 && bodyVal >= 0.00001
      && lowerShadow > 0.00010
     )
     {

      //     Print("candle is hanging man canlde");

      return true;

     }

   else

      return false;

  }
//+------------------------------------------------------------------+
//|                    bearish engulfing pattern                     |
//+------------------------------------------------------------------+
bool Candles::bearishEngulfing(int i)
  {

   if(bulish(i + 1) && bearish(i)
      && Open[i] > Close[i + 1]
      && Close[i + i] > Open[i + 1])

     {

      //     Print("candle is bearish Engulfing canlde");

      return true;

     }

   else

      return false;

  }
//+------------------------------------------------------------------+
//|                    Bulish engulfing pattern                     |
//+------------------------------------------------------------------+
bool Candles::bulishEngulfing(int i)
  {

   if(bearish(i + 1) && bulish(i)
      && Close[i] > Open[i + 1]
      && Open[i] > Close[i + 1])

     {

      //     Print("candle is bulish Engulfing canlde");

      return true;

     }

   else

      return false;

  }
//+------------------------------------------------------------------+
//|                    Dark cloud pattern                     |
//+------------------------------------------------------------------+
bool Candles::darkCloudCover(int i)
  {

   if(bulish(i + 1) && bearish(i)
      && Open[i] > Close[i + 1]
      && Close[i] > ((body(i + 1) / 2) + Open[i +1])
      && Volume[i] > Volume[i + 1])

     {

      //     Print("candle is dark cloud cover canlde");

      return true;

     }

   else

      return false;

  }
//+------------------------------------------------------------------+
//|                        PIERCING PATTERN
//+------------------------------------------------------------------+
bool Candles::piercingPattern(int i)
  {

   if(bulish(i) && bearish(i + 1)
      && Open[i] < Close[i + 1]
      && Close[i] > ((body(i + 1) / 2) + Close[i +1])
      && Volume[i] > Volume[i + 1]
      && Close[i] < Open[i + 1])

     {

      //     Print("candle is piercing pattern canlde");

      return true;

     }

   else

      return false;

  }
//+------------------------------------------------------------------+
//|                        Morning Star
//+------------------------------------------------------------------+
bool Candles::morningStar(int i)
  {

   if(bearish(i + 2)  && bulish(i)
      && starCandle(i + 1)
      && Close[i + 1] < Close[i + 2]
      && Open[i] > Close[i + 1]
      && Close[i] >= (body(i + 2) / 2 + Close[i + 2])
     )

     {

      //     Print("candle is morning star canlde");

      return true;

     }

   else

      return false;

  }
//+------------------------------------------------------------------+
//|                        Evening Star
//+------------------------------------------------------------------+
bool Candles::eveningStar(int i)
  {

   if(bulish(i + 2)  && bearish(i)
      && starCandle(i + 1)
      && Open[i + 1] > Close[i + 2]
      && Close[i] < (body(i + 2) / 2 + Open[i + 2])
     )

     {

      //     Print("candle is evening star canlde");

      return true;

     }

   else

      return false;

  }
//+------------------------------------------------------------------+
//|                        SHOOTING STAR
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                        Inverted Hammer
//+------------------------------------------------------------------+
bool Candles::shadowLongUpper(int i)
  {

   double upperShadow;

   double bodyVal = MathAbs(Close[i] - Open[i]);

   if(Open[i] > Close[i])
     {

      upperShadow = High[i] - Open[i];

     }
   else

      upperShadow = High[i] - Close[i];

   if(bodyVal <= 0.00006 && bodyVal >= 0.00001
      && upperShadow > 0.00010
     )
     {

      //     Print("candle is hanging man canlde");

      return true;

     }

   else

      return false;

  }
//+------------------------------------------------------------------+
//|                  Harami Pattern
//+------------------------------------------------------------------+
bool Candles::haramiPattern(int i)
  {

   if(starCandle(i))
     {

      if(bearish(i) && bulish(i + 1) && Close[i] > Open[i +1] && Open[i] < Close[i +1])


        {

         //     Print("candle is harami canlde");

         return true;

        }

      else
         if(bearish(i) && bearish(i + 1) && Open[i] < Open[i +1] && Close[i] > Close[i +1])

           {

            //     Print("candle is harami canlde");

            return true;

           }

         else
            if(bulish(i) && bulish(i + 1) && Open[i] > Open[i +1] && Close[i] < Close[i +1])

              {

               //     Print("candle is harami canlde");

               return true;

              }

            else

               if(bulish(i) && bearish(i) && Open[i] < Close[i + 1] && Close[i] > Open[i + 1])

                 {

                  //     Print("candle is harami canlde");

                  return true;

                 }

               else

                  return false;

     }

   else

      return false;

  }
//+------------------------------------------------------------------+
//|                  Harami Pattern
//+------------------------------------------------------------------+
bool Candles::haramiCrossPattern(int i)
  {

   if(dojiCandle(i))
     {

      if(bearish(i) && bulish(i + 1) && Close[i] > Open[i +1] && Open[i] < Close[i +1])

        {

         //     Print("candle is harami cross candle");

         return true;

        }

      else

         if(bearish(i) && bearish(i + 1) && Open[i] < Open[i +1] && Close[i] > Close[i +1])

           {

            //     Print("candle is harami cross candle");

            return true;

           }

         else

            if(bulish(i) && bulish(i + 1) && Open[i] > Open[i +1] && Close[i] < Close[i +1])

              {

               //     Print("candle is harami cross candle");

               return true;

              }

            else

               if(bulish(i) && bearish(i) && Open[i] < Close[i + 1] && Close[i] > Open[i + 1])

                 {

                  //     Print("candle is harami cross candle");

                  return true;

                 }

               else
                  return false;

     }

   else

      return false;

  }
//+------------------------------------------------------------------+
//|                        Tweezers Top
//+------------------------------------------------------------------+
bool Candles::tweezersTop(int i)
  {

   if(bearish(i) && bulish(i + 1))
     {

      if(Open[i] == Close[i + 1])

        {

         //     Print("candle is tweezers top candle");

         return true;

        }

      else

         return false;

     }

   else
      if(bearish(i) && bearish(i + 1))

        {

         if(Open[i] == Open[i + 1])

           {

            //     Print("candle is tweezers top candle");

            return true;

           }


         else

            return false;

        }
      else
         if(bulish(i) && bulish(i + 1))

           {

            if(Close[i] == Close[i + 1])

              {

               //     Print("candle is tweezers top candle");

               return true;

              }


            else

               return false;

           }

         else
            if(bulish(i) && bearish(i))
              {

               if(Close[i] == Open[i + 1])

                 {

                  //     Print("candle is tweezers top candle");

                  return true;

                 }


               else

                  return false;

              }

            else

               return false;

  }
//+------------------------------------------------------------------+
//|                        Tweezers Bottom
//+------------------------------------------------------------------+
bool Candles::tweezersBottom(int i)
  {

   if(bearish(i) && bulish(i + 1))
     {

      if(Close[i] == Open[i + 1])

        {

         //     Print("candle is tweezers bottom candle");

         return true;

        }


      else

         return false;

     }

   else
      if(bearish(i) && bearish(i + 1))

        {

         if(Close[i] == Close[i + 1])

           {

            //     Print("candle is tweezers bottom candle");

            return true;

           }

         else

            return false;

        }
      else
         if(bulish(i) && bulish(i + 1))

           {

            if(Open[i] == Open[i + 1])

              {

               //     Print("candle is tweezers bottom candle");

               return true;

              }

            else

               return false;

           }

         else
            if(bulish(i) && bearish(i))
              {

               if(Open[i] == Close[i + 1])

                 {

                  //     Print("candle is tweezers bottom candle");

                  return true;

                 }

               else

                  return false;

              }

            else

               return false;

  }
//+------------------------------------------------------------------+
//|                       Bulish Inverted Hammer
//+------------------------------------------------------------------+
bool Candles::bulishBeltHoldLine(int i)
  {

   if(
      bulish(i)
      && candleLong(i)
      && shadowLower(i) == 0.0
   )

     {

      //     Print("candle is bulish belt hold line candle");

      return true;

     }

   else

      return false;

  }
//+------------------------------------------------------------------+
//|                       Raising three method
//+------------------------------------------------------------------+
bool Candles::rasingThreeMethod(int i)
  {

   if(
      bulish(i + 4)
      && candleLong(i + 4)
      && bearish(i + 3)
      && bearish(i + 2)
      && bearish(i + 1)
      && bulish(i)
      && candleLong(i)
   )

     {

      //     Print("candle is raising three method candle");

      return true;

     }

   else

      return false;

  }
//+------------------------------------------------------------------+
//|                       Falling three methods
//+------------------------------------------------------------------+
bool Candles::fallingThreeMethod(int i)
  {

   if(
      bearish(i + 4)
      && candleLong(i + 4)
      && bulish(i + 3)
      && bulish(i + 2)
      && bulish(i + 1)
      && bearish(i)
      && candleLong(i)
   )

     {

      //     Print("candle is falling three method candle");

      return true;

     }

   else

      return false;

  }
//+------------------------------------------------------------------+
//|                       Grave Stone Ddji
//+------------------------------------------------------------------+
bool Candles::gravestoneDoji(int i)
  {

   if(
      dojiCandle(i)
      && shadowLongUpper(i)
      && shadowLower(i) <= 0.00001
   )

     {

      //     Print("candle is grave stone candle");

      return true;

     }

   else

      return false;

  }
//+------------------------------------------------------------------+
//|                       Dragonfly Ddji
//+------------------------------------------------------------------+
bool Candles::dragonflyDoji(int i)
  {

   if(
      dojiCandle(i)
      && shadowLongLower(i)
   )

     {

      //     Print("candle is dragonfly doji candle");

      return true;

     }

   else

      return false;

  }
//+------------------------------------------------------------------+
//|                       Dragonfly Ddji
//+------------------------------------------------------------------+
bool Candles::longLeggedDoji(int i)
  {

   if(
      dojiCandle(i)
      && shadowLongLower(i)
      && shadowLongUpper(i)
   )

     {

      //     Print("candle is long legged doji candle");

      return true;

     }

   else

      return false;

  }
//+------------------------------------------------------------------+
