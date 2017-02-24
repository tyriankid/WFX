namespace Hidistro.Entities.Store
{
    using System;
    using System.Runtime.CompilerServices;

    public class DeliveryOrderInfo
    {
        public virtual int StoreId { get; set; }

        public virtual int DeliveryOrderId { get; set; }

        public virtual string OrderId { get; set; }

        public virtual int State { get; set; }

        public virtual int DeliveryUserId { get; set; }

        public virtual DateTime AddTime { get; set; }

        public virtual DateTime ArrivedTime { get; set; }
    }
}

