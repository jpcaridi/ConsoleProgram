using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ConsoleProgram
{
    public class DataModelExtension
    {
    }

    public partial class Address
    {
        public override string ToString()
        {
            return "" + this.Street + " " + this.City + " " + this.State + " " + this.PostalCode + " " + this.Country;
        }
    }
}
