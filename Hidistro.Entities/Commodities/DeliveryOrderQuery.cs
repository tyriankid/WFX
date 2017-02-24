namespace Hidistro.Entities.Commodities
{
    using Hidistro.Core;
    using Hidistro.Core.Entities;
    using System;
    using System.Runtime.CompilerServices;

    public class DeliveryOrderQuery : Pagination
    {
        public DateTime? EndDate { get; set; }

        public string OrderId { get; set; }

        public DateTime? StartDate { get; set; }

        public int DeliveryUserId { get; set; }

        public int State { get; set; }

        public int StoreId { get; set; }
    }
}

