using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace StadiumSeating
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            txtClassA.Clear();
            txtClassB.Clear();
            txtClassC.Clear();
            lblClassArevenue.Text = "";
            lblClassBrevenue.Text = "";
            lblClassCrevenue.Text = "";
            lblTotalRevenue.Text = "";
            lblMessage.Text = "";
        }

        private void btnCalculate_Click(object sender, EventArgs e)
        {
            // set prices
            double priceA = 15.0;
            double priceB = 12.0;
            double priceC = 9.0;

            // clear the message
            lblMessage.Text = "";

            // calculate the charges
            try
            {
                double revenueA, revenueB, revenueC, revenueTotal;

                revenueA = double.Parse(txtClassA.Text) * priceA;
                // format the string with two decimal places but without $
                // you can always change the format to "C" for currency.
                lblClassArevenue.Text = revenueA.ToString("F");

                revenueB = double.Parse(txtClassB.Text) * priceB;
                lblClassBrevenue.Text = revenueB.ToString("F");

                revenueC = double.Parse(txtClassC.Text) * priceC;
                lblClassCrevenue.Text = revenueC.ToString("F");

                revenueTotal = revenueA + revenueB + revenueC;
                lblTotalRevenue.Text = revenueTotal.ToString("F");

            }
            catch(Exception error)
            {

                lblMessage.Text = error.Message;
            }
        }
    }
}
