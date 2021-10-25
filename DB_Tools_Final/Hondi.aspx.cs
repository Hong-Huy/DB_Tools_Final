using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB_Tools_Final
{
    public partial class Hondi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            panPricing.Visible = false;
            panFinal.Visible = false;

            if (!Page.IsPostBack)
            {
                txtPhone.Visible = lblPhone.Visible = false;

                cboCar.Items.Add(new ListItem("DR-V (+$30000)", "30000"));
                cboCar.Items.Add(new ListItem("DR-A (+$20000)", "20000"));
                cboCar.Items.Add(new ListItem("DR-X (+$60000)", "60000"));
                cboCar.Items.Add(new ListItem("DR-Z (+$90000)", "90000"));

                listColor.Items.Add(new ListItem("White (Free)", "0"));
                listColor.Items.Add(new ListItem("Dark (+$300)", "300"));
                listColor.Items.Add(new ListItem("Pearl (+$900)", "900"));
                listColor.SelectedIndex = 0;

                chklstAccessories.Items.Add(new ListItem("Aero Kit (+$1300)", "1300"));
                chklstAccessories.Items.Add(new ListItem("Film (+$600)", "600"));
                chklstAccessories.Items.Add(new ListItem("Cold Weather (+$900)", "900"));
                chklstAccessories.Items.Add(new ListItem("Hondi Emblem (+$150)", "150"));
                chklstAccessories.Items.Add(new ListItem("Snow Tire Package (+$1800)", "1800"));

                radlstWarranty.Items.Add(new ListItem("3 Years", "2000"));
                radlstWarranty.Items.Add(new ListItem("5 Years", "4000"));
                radlstWarranty.Items.Add(new ListItem("7 Years", "6000"));
                radlstWarranty.SelectedIndex = 0;
            }

            if (cboCar.SelectedIndex > 0)
            {
                calculatePrice();
            }
        }

        private void calculatePrice()
        {
            decimal baseP = 0, intColor = 0, accessories = 0, warranty = 0, subtotal = 0, tax = 0, total = 0;

            baseP = Convert.ToDecimal(cboCar.SelectedItem.Value);
            litPricing.Text = "<br><b>Car Price: $</b>" + baseP + "</br>";

            intColor = Convert.ToDecimal(listColor.SelectedItem.Value);
            litPricing.Text += "<b>Interior Color: $</b>" + intColor + "</br>";

            foreach (ListItem item in chklstAccessories.Items)
            {
                accessories += (item.Selected) ? Convert.ToDecimal(item.Value) : 0;
            }
            litPricing.Text += "<b>Accessories: $</b>" + accessories + "</br>";

            warranty = Convert.ToDecimal(radlstWarranty.SelectedItem.Value);
            litPricing.Text += "<b>Warranty: $</b>" + warranty + "</br>";

            subtotal = Convert.ToDecimal(baseP + intColor + accessories + warranty);
            litPricing.Text += "<br><b>Total before taxes: $</b>" + subtotal + "</br>";

            tax += Math.Round(subtotal * Convert.ToDecimal(0.15), 2);
            litPricing.Text += "<b>Taxes (15%): $ </b>" + tax + "<br />";

            total = Math.Round(subtotal + tax, 2);
            litPricing.Text += "<b>Total Price : $ </b>" + total + "<br />";

            panPricing.Visible = true;

        }

        
        protected void cboCar_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void chkboxContact_CheckedChanged(object sender, EventArgs e)
        {
            lblPhone.Visible = txtPhone.Visible = true;
        }

        protected void btnConclude_Click1(object sender, EventArgs e)
        {
            panFinal.Visible = true;

            litFinal.Text = "Congratulations on obtaining your new Hondi " + cboCar.SelectedItem.Text + " <br>in" + txtCity.Text + ", " + txtZip.Text + ". <br>";

            litFinal.Text += "<br> Your car comes with " + listColor.SelectedItem.Text + " interior color <br>";

            foreach (ListItem item in chklstAccessories.Items)
            {
                litFinal.Text += (item.Selected) ? ", " + item.Text : "";
            }

            litFinal.Text += "<br> accessories. <br><br> You chose a " + radlstWarranty.SelectedItem.Text + " warranty. <br>";
            litFinal.Text += (chkboxContact.Checked) ? "Our dealership will contact you with the phone number you provided: <br> " + txtPhone.Text : "Please come to our branch for your papers.";

        }
    }
}