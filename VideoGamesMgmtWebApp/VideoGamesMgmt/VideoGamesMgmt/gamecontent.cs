//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace VideoGamesMgmt
{
    using System;
    using System.Collections.Generic;
    
    public partial class gamecontent
    {
        public int GC_ID { get; set; }
        public Nullable<int> GC_VGCon_ID { get; set; }
        public Nullable<int> GC_Completeness_ID { get; set; }
        public Nullable<decimal> GC_AmtPurchased { get; set; }
        public Nullable<decimal> GC_CurMarketValue { get; set; }
        public Nullable<int> GC_Condition_ID { get; set; }
        public Nullable<System.DateTime> GC_DatePurchased { get; set; }
    
        public virtual conditionsmaster conditionsmaster { get; set; }
        public virtual gamecomleteness gamecomleteness { get; set; }
        public virtual videogamesconsole videogamesconsole { get; set; }
    }
}