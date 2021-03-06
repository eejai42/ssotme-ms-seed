using System;
using System.ComponentModel;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;
using MorseCodeSDK.Lib.SqlDataManagement;
using CoreLibrary.Extensions;

namespace MorseCodeSDK.Lib.DataClasses
{                            
    public partial class Listener
    {
        private void InitPoco()
        {
            
            this.ListenerId = Guid.NewGuid();
            

        }

        
        [JsonProperty(DefaultValueHandling = DefaultValueHandling.IgnoreAndPopulate, PropertyName = "ListenerId")]
        public Guid ListenerId { get; set; }
    
        [JsonProperty(DefaultValueHandling = DefaultValueHandling.IgnoreAndPopulate, PropertyName = "Name")]
        public String Name { get; set; }
    
        [JsonProperty(DefaultValueHandling = DefaultValueHandling.IgnoreAndPopulate, PropertyName = "Description")]
        public String Description { get; set; }
    

        

        

        private static string CreateListenerWhere(IEnumerable<Listener> listeners)
        {
            if (!listeners.Any()) return "1=1";
            else 
            {
                var idList = listeners.Select(selectListener => String.Format("'{0}'", selectListener.ListenerId));
                var csIdList = String.Join(",", idList);
                return String.Format("ListenerId in ({0})", csIdList);
            }
        }
        
        public static void CheckExpand(SqlDataManager sdm, IEnumerable<Listener> listeners, string expandString)
        {
            
        }
        
    }
}