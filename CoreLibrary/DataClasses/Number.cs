/*************************************************
Initially Generated by SSoT.me - 2017
    EJ Alexandra - An odxml42 Tool
    This file will not be overwritten by default!
*************************************************/
using System;
using System.ComponentModel;
                        
namespace MorseCodeSDK.Lib.DataClasses
{                   
    
    public partial class Number 
    {
        public Number()
        {
            this.InitPoco();
        }

        public override String ToString()
        {
            return String.Format("Number: {0}", this.Name);
        }
    }
}