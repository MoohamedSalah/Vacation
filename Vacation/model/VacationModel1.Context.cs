﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Vacation.model
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class VacationConstring : DbContext
    {
        public VacationConstring()
            : base("name=VacationConstring")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Department> Department { get; set; }
        public virtual DbSet<Vacations> Vacation { get; set; }
    
        public virtual ObjectResult<spGrdManager_Result> spGrdManager()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<spGrdManager_Result>("spGrdManager");
        }
    }
}
