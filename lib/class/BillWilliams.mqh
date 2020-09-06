//+------------------------------------------------------------------+
//|                                                 billWilliams.mqh |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql4.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql4.com"
#property version   "1.00"
#property strict
class BillWilliams
  {
private:

   string            symbol;
   int               mfiTimeframe;
   int               aoTimeframe;
   int               goTimeframe;
   int               goMa_method;
   int               goApplied_price;
   int               goUpperLineMode;
   int               goLowerLineMode;
   int               alligatorTimeframe;
   int               alligatorMa_method;
   int               alligatorApplied_price;
   int               alligatorJawLineMode;
   int               alligatorTeethLineMode;
   int               alligatorLipsLineMode;
   int               goJaw_period;
   int               goJaw_shift;
   int               goTeeth_period;
   int               goTeeth_shift;
   int               goLips_period;
   int               goLips_shift;

public:
                     BillWilliams();

   double            marketFacilitationIndexIndicator(int mfiShift);

   double            awesomeOscillator(int aoShift);

   string            awesomeOscillatorColor(int aoShift);

   bool              awesomeOscillatorBuyEntryCondtitino();

   bool              awesomeOscillatorSellEntryCondtitino();

   double            gatorUpperLineOscillator(
      int goJaw_period,
      int goJaw_shift,
      int goTeeth_period,
      int goTeeth_shift,
      int goLips_period,
      int goLips_shift,
      int goShift);

   double            gatorLowerLineOscillator(
      int goJaw_period,
      int goJaw_shift,
      int goTeeth_period,
      int goTeeth_shift,
      int goLips_period,
      int goLips_shift,
      int goShift
   );

   string            gatorUpperLineOscillatorColor(int goShift);

   string            gatorLowerLineOscillatorColor(int goShift);

   string            gatorOscillatorStatus(int gsShift);

   double            alligatorJawLineIndicator(
      int alligatorJaw_period,
      int alligatorJaw_shift,
      int alligatorTeeth_period,
      int alligatorTeeth_shift,
      int alligatorLips_period,
      int alligatorLips_shift,
      int alligatorShift);

   double            alligatorTeethLineIndicator(
      int alligatorJaw_period,
      int alligatorJaw_shift,
      int alligatorTeeth_period,
      int alligatorTeeth_shift,
      int alligatorLips_period,
      int alligatorLips_shift,
      int alligatorShift);

   double            alligatorLipsLineIndicator(
      int alligatorJaw_period,
      int alligatorJaw_shift,
      int alligatorTeeth_period,
      int alligatorTeeth_shift,
      int alligatorLips_period,
      int alligatorLips_shift,
      int alligatorShift);



   string            marketFacilitationIndexColor(int mfiShift);

                    ~BillWilliams();
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
BillWilliams::BillWilliams()
  {

   symbol = NULL;
   mfiTimeframe = 0;
   aoTimeframe = 0;
   goTimeframe = 0;
   goMa_method = 2;
   goApplied_price = 0;
   goUpperLineMode = 1;
   goLowerLineMode = 2;
   alligatorTimeframe = 0;
   alligatorMa_method = 2;
   alligatorApplied_price = 0;
   alligatorJawLineMode = 1;
   alligatorTeethLineMode = 2;
   alligatorLipsLineMode = 3;
   goJaw_period = 13;
   goJaw_shift = 8;
   goTeeth_period = 8;
   goTeeth_shift = 5;
   goLips_period = 5;
   goLips_shift = 3;


  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
BillWilliams::~BillWilliams()
  {
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                        Market Facility Index                                           |
//+------------------------------------------------------------------+
double BillWilliams::marketFacilitationIndexIndicator(int mfiShift)
  {

   return iBWMFI(symbol, mfiTimeframe, mfiShift);

  }

//+------------------------------------------------------------------+
//|             Market Facility Index color
//+------------------------------------------------------------------+
string BillWilliams::marketFacilitationIndexColor(int mfiShift)
  {

//double Candle_1 = iOpen(SYMBOL,PERIOD,SHIFT) - iClose(SYMBOL,PERIOD,SHIFT);
//double Candle_2 = iOpen(SYMBOL,PERIOD,SHIFT+1) - iClose(SYMBOL,PERIOD,SHIFT+1);
//if( Candle_1 < 0 ) Candle_1 = Candle_1 - Candle_1*2;
//if( Candle_2 < 0 ) Candle_2 = Candle_2 - Candle_2*2;
//if( Candle_1 >  Candle_2 && iVolume(SYMBOL,PERIOD,SHIFT+1) <  iVolume(SYMBOL,PERIOD,SHIFT) ) return("green");
//if( Candle_1 <= Candle_2 && iVolume(SYMBOL,PERIOD,SHIFT+1) >= iVolume(SYMBOL,PERIOD,SHIFT) ) return("brown");
//if( Candle_1 >  Candle_2 && iVolume(SYMBOL,PERIOD,SHIFT+1) >= iVolume(SYMBOL,PERIOD,SHIFT) ) return("blue");
//if( Candle_1 <= Candle_2 && iVolume(SYMBOL,PERIOD,SHIFT+1) <  iVolume(SYMBOL,PERIOD,SHIFT) ) return("pink");
//return(0);

   double mfi_1 = iBWMFI(NULL, 0, mfiShift);
   double mfi_2 = iBWMFI(NULL, 0, mfiShift + 1);
   long vol_1 = Volume[mfiShift];
   long vol_2 = Volume[mfiShift + 1];

   if(mfi_1 > mfi_2 && vol_1 > vol_2)
     {

      return "GREEN";

     }


   else
      if(mfi_1 < mfi_2 && vol_1 < vol_2)
        {

         return "BROWN";

        }


      else
         if(mfi_1 > mfi_2 && vol_1 < vol_2)
           {

            return "BLUE";

           }


         else
            if(mfi_1 < mfi_2 && vol_1 > vol_2)
              {

               return "PINK";

              }

            else
               return "NOTHING";

  }
//+------------------------------------------------------------------+
//|                      Awesome oscillato                                            |
//+------------------------------------------------------------------+
double BillWilliams::awesomeOscillator(int aoShift)
  {

   return iAO(symbol, aoTimeframe, aoShift);

  }
//+------------------------------------------------------------------+
//|                      Awesome oscillato  color                                          |
//+------------------------------------------------------------------+
string BillWilliams::awesomeOscillatorColor(int aoShift)
  {

   if(awesomeOscillator(aoShift) > awesomeOscillator(aoShift + 1))
     {

      return "GREEN";
     }

   else
      if(awesomeOscillator(aoShift) < awesomeOscillator(aoShift + 1))
        {

         return "RED";
        }

      else
         return "DO NORHING";
  }
//+------------------------------------------------------------------+
//|                    Upper line Gator oscillator
//+------------------------------------------------------------------+
double  BillWilliams::gatorUpperLineOscillator(
   int goJawPeriod,
   int goJawShift,
   int goTeethPeriod,
   int goTeethShift,
   int goLipsPeriod,
   int goLipsShift,
   int goShift)

  {

   return  iGator(
              symbol,
              goTimeframe,
              goJawPeriod,
              goJawShift,
              goTeethPeriod,
              goTeethShift,
              goLipsPeriod,
              goLipsShift,
              goMa_method,
              goApplied_price,
              goUpperLineMode,
              goShift
           );

  }
//+------------------------------------------------------------------+
//|                     Lower line Gator oscillator
//+------------------------------------------------------------------+
double  BillWilliams::gatorLowerLineOscillator(
   int goJawPeriod,
   int goJawShift,
   int goTeethPeriod,
   int goTeethShift,
   int goLipsPeriod,
   int goLipsShift,
   int goShift)
  {

   return  iGator(
              symbol,
              goTimeframe,
              goJawPeriod,
              goJawShift,
              goTeethPeriod,
              goTeethShift,
              goLipsPeriod,
              goLipsShift,
              goMa_method,
              goApplied_price,
              goLowerLineMode,
              goShift
           );

  }
//+------------------------------------------------------------------+
//|                     Alligator oscillator
//+------------------------------------------------------------------+
double BillWilliams::alligatorJawLineIndicator(
   int alligatorJaw_period,
   int alligatorJaw_shift,
   int alligatorTeeth_period,
   int alligatorTeeth_shift,
   int alligatorLips_period,
   int alligatorLips_shift,
   int alligatorShift)
  {

   return iAlligator(
             symbol,
             alligatorTimeframe,
             alligatorJaw_period,
             alligatorJaw_shift,
             alligatorTeeth_period,
             alligatorTeeth_shift,
             alligatorLips_period,
             alligatorLips_shift,
             alligatorMa_method,
             alligatorApplied_price,
             alligatorJawLineMode,
             alligatorShift
          );

  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                     Alligator oscillator
//+------------------------------------------------------------------+
double BillWilliams:: alligatorTeethLineIndicator(
   int alligatorJaw_period,
   int alligatorJaw_shift,
   int alligatorTeeth_period,
   int alligatorTeeth_shift,
   int alligatorLips_period,
   int alligatorLips_shift,
   int alligatorShift)
  {

   return iAlligator(
             symbol,
             alligatorTimeframe,
             alligatorJaw_period,
             alligatorJaw_shift,
             alligatorTeeth_period,
             alligatorTeeth_shift,
             alligatorLips_period,
             alligatorLips_shift,
             alligatorMa_method,
             alligatorApplied_price,
             alligatorTeethLineMode,
             alligatorShift
          );

  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                     Alligator oscillator
//+------------------------------------------------------------------+
double BillWilliams::alligatorLipsLineIndicator(
   int alligatorJaw_period,
   int alligatorJaw_shift,
   int alligatorTeeth_period,
   int alligatorTeeth_shift,
   int alligatorLips_period,
   int alligatorLips_shift,
   int alligatorShift)

  {

   return iAlligator(
             symbol,
             alligatorTimeframe,
             alligatorJaw_period,
             alligatorJaw_shift,
             alligatorTeeth_period,
             alligatorTeeth_shift,
             alligatorLips_period,
             alligatorLips_shift,
             alligatorMa_method,
             alligatorApplied_price,
             alligatorLipsLineMode,
             alligatorShift
          );

  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
bool BillWilliams::awesomeOscillatorBuyEntryCondtitino()
  {

   if(awesomeOscillator(0) > 0 && awesomeOscillator(1) < 0)
      return true;
   else
      if(
         awesomeOscillator(0) > 0
         && awesomeOscillatorColor(0) == "GREEN"
         && awesomeOscillatorColor(1) == "RED"
         && awesomeOscillatorColor(2) == "RED"
         && awesomeOscillator(1) < awesomeOscillator(2)
      )

         return true;

      else
         return false;




  }
////////////////////////////////////////////////////////////////////////
bool BillWilliams::awesomeOscillatorSellEntryCondtitino()
  {

   if(awesomeOscillator(0) < 0 && awesomeOscillator(1) > 0)
      return true;

   else
      if(
         awesomeOscillator(0) < 0
         && awesomeOscillatorColor(0) == "RED"
         && awesomeOscillatorColor(1) == "GREEN"
         && awesomeOscillatorColor(2) == "GREEN"
         && awesomeOscillator(1) < awesomeOscillator(2)
      )

         return true;

      else
         return false;

  }
//+------------------------------------------------------------------+
string BillWilliams::gatorUpperLineOscillatorColor(int goShift)
  {
   if(gatorUpperLineOscillator(goJaw_period, goJaw_shift, goTeeth_period, goTeeth_shift, goLips_period, goLips_shift, goShift)
      > gatorUpperLineOscillator(goJaw_period, goJaw_shift, goTeeth_period, goTeeth_shift, goLips_period, goLips_shift, goShift + 1))
     {

      return "GREEN";
     }

   else
      if(gatorUpperLineOscillator(goJaw_period, goJaw_shift, goTeeth_period, goTeeth_shift, goLips_period, goLips_shift, goShift)
         < gatorUpperLineOscillator(goJaw_period, goJaw_shift, goTeeth_period, goTeeth_shift, goLips_period, goLips_shift, goShift + 1))
        {

         return "RED";

        }

      else

         return "DO NORHING";



  }
//+----------------------------------------------------------------------
string BillWilliams::gatorLowerLineOscillatorColor(int goShift)
  {
   if(gatorLowerLineOscillator(goJaw_period, goJaw_shift, goTeeth_period, goTeeth_shift, goLips_period, goLips_shift, goShift)
      > gatorLowerLineOscillator(goJaw_period, goJaw_shift, goTeeth_period, goTeeth_shift, goLips_period, goLips_shift,goShift + 1))
     {

      return "GREEN";
     }

   else
      if(gatorLowerLineOscillator(goJaw_period, goJaw_shift, goTeeth_period, goTeeth_shift, goLips_period, goLips_shift, goShift)
         < gatorLowerLineOscillator(goJaw_period, goJaw_shift, goTeeth_period, goTeeth_shift, goLips_period, goLips_shift, goShift + 1))
        {

         return "RED";
        }

      else

         return "DO NORHING";

  }
//+------------------------------------------------------------------+
string BillWilliams::gatorOscillatorStatus(int gsShift)
  {

   if(gatorLowerLineOscillatorColor(gsShift) == "RED"
      &&  gatorLowerLineOscillatorColor(gsShift) == "RED")
     {

      return "SLEEP";

     }
   else
      if((gatorLowerLineOscillatorColor(gsShift) == "RED"
          && gatorLowerLineOscillatorColor(gsShift) == "GREEN")
         || (gatorLowerLineOscillatorColor(gsShift) == "GREEN"
             &&  gatorLowerLineOscillatorColor(gsShift) == "RED"))

        {

         return "AWAKES";

        }
      else
         if(gatorUpperLineOscillatorColor(gsShift) == "GREEN"
            &&  gatorLowerLineOscillatorColor(gsShift) == "GREEN")
           {

            return "EATS";

           }

         else
            if((gatorUpperLineOscillatorColor(gsShift) == "RED"
                && gatorLowerLineOscillatorColor(gsShift) == "GREEN")

               ||

               (gatorUpperLineOscillatorColor(gsShift) == "GREEN"
                &&  gatorLowerLineOscillatorColor(gsShift) == "RED"))

              {

               return "FILLS_OUT";

              }

            else

               return "DO NOTHING";

  }
//+------------------------------------------------------------------+
