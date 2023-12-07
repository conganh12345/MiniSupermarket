﻿namespace MiniSupermarket.GUI
{
    partial class SaleForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            pnl_top = new Panel();
            pnlAddBill = new Panel();
            pnlAddBtn = new Panel();
            btnDelBill = new Button();
            btnAddBill = new Button();
            grbCustomerInfo = new GroupBox();
            btnReset = new Button();
            ckNewCustomer = new CheckBox();
            txtSearchCustomer = new TextBox();
            rdFemale = new RadioButton();
            rdMale = new RadioButton();
            txtPhone = new TextBox();
            txtCustomerName = new TextBox();
            lbSex = new Label();
            lbPhone = new Label();
            lbCustomerName = new Label();
            cbChooseCustomer = new ComboBox();
            lbChooseCustomer = new Label();
            gbSearch = new GroupBox();
            cbChonDenNgay = new CheckBox();
            cbChonTuNgay = new CheckBox();
            cbNotPay = new CheckBox();
            txtToTotal = new TextBox();
            txtFromTotal = new TextBox();
            lbTotal = new Label();
            btnClearSearch = new Button();
            lbEmployee = new Label();
            lbCustomer = new Label();
            btnSearch = new Button();
            cbPay = new CheckBox();
            txtEmployeeSearch = new TextBox();
            txtCustomerSearch = new TextBox();
            dtpToDate = new DateTimePicker();
            dtpFromDate = new DateTimePicker();
            lbToDate = new Label();
            lbFromDate = new Label();
            pnl_bottom = new Panel();
            dgv_bill = new DataGridView();
            btnInHoaDon = new Button();
            pnl_top.SuspendLayout();
            pnlAddBill.SuspendLayout();
            pnlAddBtn.SuspendLayout();
            grbCustomerInfo.SuspendLayout();
            gbSearch.SuspendLayout();
            pnl_bottom.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)dgv_bill).BeginInit();
            SuspendLayout();
            // 
            // pnl_top
            // 
            pnl_top.Controls.Add(pnlAddBill);
            pnl_top.Controls.Add(gbSearch);
            pnl_top.Dock = DockStyle.Top;
            pnl_top.Location = new Point(0, 0);
            pnl_top.Name = "pnl_top";
<<<<<<< HEAD
            pnl_top.Size = new Size(1136, 264);
=======
            pnl_top.Size = new Size(1298, 352);
>>>>>>> main
            pnl_top.TabIndex = 0;
            // 
            // pnlAddBill
            // 
            pnlAddBill.Controls.Add(pnlAddBtn);
            pnlAddBill.Controls.Add(grbCustomerInfo);
            pnlAddBill.Dock = DockStyle.Fill;
            pnlAddBill.Location = new Point(0, 0);
            pnlAddBill.Name = "pnlAddBill";
<<<<<<< HEAD
            pnlAddBill.Size = new Size(621, 264);
=======
            pnlAddBill.Size = new Size(709, 352);
>>>>>>> main
            pnlAddBill.TabIndex = 2;
            // 
            // pnlAddBtn
            // 
            pnlAddBtn.Controls.Add(btnDelBill);
            pnlAddBtn.Controls.Add(btnAddBill);
            pnlAddBtn.Dock = DockStyle.Fill;
            pnlAddBtn.Location = new Point(0, 273);
            pnlAddBtn.Name = "pnlAddBtn";
<<<<<<< HEAD
            pnlAddBtn.Size = new Size(621, 59);
=======
            pnlAddBtn.Size = new Size(709, 79);
>>>>>>> main
            pnlAddBtn.TabIndex = 2;
            // 
            // btnDelBill
            // 
            btnDelBill.Dock = DockStyle.Fill;
            btnDelBill.FlatStyle = FlatStyle.Flat;
            btnDelBill.Location = new Point(351, 0);
            btnDelBill.Name = "btnDelBill";
<<<<<<< HEAD
            btnDelBill.Size = new Size(314, 59);
=======
            btnDelBill.Size = new Size(358, 79);
>>>>>>> main
            btnDelBill.TabIndex = 10;
            btnDelBill.Text = "Xóa hóa đơn";
            btnDelBill.UseVisualStyleBackColor = true;
            btnDelBill.Click += btnDelBill_Click;
            // 
            // btnAddBill
            // 
            btnAddBill.Dock = DockStyle.Left;
            btnAddBill.FlatAppearance.BorderSize = 0;
            btnAddBill.FlatStyle = FlatStyle.Flat;
            btnAddBill.Location = new Point(0, 0);
            btnAddBill.Name = "btnAddBill";
            btnAddBill.Size = new Size(351, 79);
            btnAddBill.TabIndex = 0;
            btnAddBill.Text = "Thêm hóa đơn";
            btnAddBill.UseVisualStyleBackColor = true;
            btnAddBill.Click += btnAddBill_Click;
            // 
            // grbCustomerInfo
            // 
            grbCustomerInfo.Controls.Add(btnInHoaDon);
            grbCustomerInfo.Controls.Add(btnReset);
            grbCustomerInfo.Controls.Add(ckNewCustomer);
            grbCustomerInfo.Controls.Add(txtSearchCustomer);
            grbCustomerInfo.Controls.Add(rdFemale);
            grbCustomerInfo.Controls.Add(rdMale);
            grbCustomerInfo.Controls.Add(txtPhone);
            grbCustomerInfo.Controls.Add(txtCustomerName);
            grbCustomerInfo.Controls.Add(lbSex);
            grbCustomerInfo.Controls.Add(lbPhone);
            grbCustomerInfo.Controls.Add(lbCustomerName);
            grbCustomerInfo.Controls.Add(cbChooseCustomer);
            grbCustomerInfo.Controls.Add(lbChooseCustomer);
            grbCustomerInfo.Dock = DockStyle.Top;
            grbCustomerInfo.Location = new Point(0, 0);
            grbCustomerInfo.Name = "grbCustomerInfo";
<<<<<<< HEAD
            grbCustomerInfo.Padding = new Padding(3, 2, 3, 2);
            grbCustomerInfo.Size = new Size(621, 205);
            grbCustomerInfo.TabIndex = 1;
            grbCustomerInfo.TabStop = false;
            grbCustomerInfo.Text = "Thông tin khách hàng";
=======
            grbCustomerInfo.Size = new Size(709, 273);
            grbCustomerInfo.TabIndex = 1;
            grbCustomerInfo.TabStop = false;
            grbCustomerInfo.Text = "Thông tin khách hàng";
            grbCustomerInfo.Enter += grbCustomerInfo_Enter;
            // 
            // btnDetalBill
            // 
            btnDetalBill.FlatAppearance.BorderSize = 0;
            btnDetalBill.FlatStyle = FlatStyle.Flat;
            btnDetalBill.Location = new Point(510, 219);
            btnDetalBill.Name = "btnDetalBill";
            btnDetalBill.Size = new Size(139, 37);
            btnDetalBill.TabIndex = 2;
            btnDetalBill.Text = "Chi tiết hóa đơn";
            btnDetalBill.UseVisualStyleBackColor = true;
            btnDetalBill.Click += btnDetalBill_Click;
>>>>>>> main
            // 
            // btnReset
            // 
            btnReset.FlatAppearance.BorderSize = 0;
            btnReset.FlatStyle = FlatStyle.Flat;
            btnReset.Location = new Point(376, 219);
            btnReset.Name = "btnReset";
            btnReset.Size = new Size(91, 37);
            btnReset.TabIndex = 2;
            btnReset.Text = "Reset";
            btnReset.UseVisualStyleBackColor = true;
            btnReset.Click += btnReset_Click;
            // 
            // ckNewCustomer
            // 
            ckNewCustomer.AutoSize = true;
            ckNewCustomer.Location = new Point(11, 92);
            ckNewCustomer.Name = "ckNewCustomer";
            ckNewCustomer.Size = new Size(165, 24);
            ckNewCustomer.TabIndex = 9;
            ckNewCustomer.Text = "Tạo khách hàng mới";
            ckNewCustomer.UseVisualStyleBackColor = true;
            ckNewCustomer.CheckedChanged += ckNewCustomer_CheckedChanged;
            // 
            // txtSearchCustomer
            // 
            txtSearchCustomer.Location = new Point(111, 35);
            txtSearchCustomer.Name = "txtSearchCustomer";
            txtSearchCustomer.Size = new Size(239, 27);
            txtSearchCustomer.TabIndex = 8;
            txtSearchCustomer.TextChanged += txtSearchCustomer_TextChanged;
            // 
            // rdFemale
            // 
            rdFemale.AutoSize = true;
            rdFemale.Location = new Point(219, 219);
            rdFemale.Name = "rdFemale";
            rdFemale.Size = new Size(50, 24);
            rdFemale.TabIndex = 7;
            rdFemale.TabStop = true;
            rdFemale.Text = "Nữ";
            rdFemale.UseVisualStyleBackColor = true;
            rdFemale.CheckedChanged += rdFemale_CheckedChanged;
            // 
            // rdMale
            // 
            rdMale.AutoSize = true;
            rdMale.Location = new Point(111, 219);
            rdMale.Name = "rdMale";
            rdMale.Size = new Size(62, 24);
            rdMale.TabIndex = 7;
            rdMale.TabStop = true;
            rdMale.Text = "Nam";
            rdMale.UseVisualStyleBackColor = true;
            rdMale.CheckedChanged += rdMale_CheckedChanged;
            // 
            // txtPhone
            // 
            txtPhone.Location = new Point(111, 167);
            txtPhone.Name = "txtPhone";
            txtPhone.Size = new Size(239, 27);
            txtPhone.TabIndex = 6;
            txtPhone.KeyPress += txtPhone_KeyPress;
            // 
            // txtCustomerName
            // 
            txtCustomerName.Location = new Point(111, 128);
            txtCustomerName.Name = "txtCustomerName";
            txtCustomerName.Size = new Size(239, 27);
            txtCustomerName.TabIndex = 5;
            txtCustomerName.KeyPress += txtCustomerName_KeyPress;
            // 
            // lbSex
            // 
            lbSex.AutoSize = true;
            lbSex.Location = new Point(11, 220);
            lbSex.Name = "lbSex";
            lbSex.Size = new Size(65, 20);
            lbSex.TabIndex = 4;
            lbSex.Text = "Giới tính";
            // 
            // lbPhone
            // 
            lbPhone.AutoSize = true;
            lbPhone.Location = new Point(11, 171);
            lbPhone.Name = "lbPhone";
            lbPhone.Size = new Size(49, 20);
            lbPhone.TabIndex = 3;
            lbPhone.Text = "Số ĐT";
            // 
            // lbCustomerName
            // 
            lbCustomerName.AutoSize = true;
            lbCustomerName.Location = new Point(11, 131);
            lbCustomerName.Name = "lbCustomerName";
            lbCustomerName.Size = new Size(54, 20);
            lbCustomerName.TabIndex = 2;
            lbCustomerName.Text = "Họ tên";
            // 
            // cbChooseCustomer
            // 
            cbChooseCustomer.DropDownStyle = ComboBoxStyle.DropDownList;
            cbChooseCustomer.FormattingEnabled = true;
            cbChooseCustomer.Location = new Point(376, 35);
            cbChooseCustomer.Name = "cbChooseCustomer";
            cbChooseCustomer.Size = new Size(239, 28);
            cbChooseCustomer.TabIndex = 1;
            cbChooseCustomer.SelectedIndexChanged += cbChooseCustomer_SelectedIndexChanged;
            // 
            // lbChooseCustomer
            // 
            lbChooseCustomer.AutoSize = true;
            lbChooseCustomer.Location = new Point(11, 37);
            lbChooseCustomer.Name = "lbChooseCustomer";
            lbChooseCustomer.Size = new Size(67, 20);
            lbChooseCustomer.TabIndex = 0;
            lbChooseCustomer.Text = "Chọn KH";
            // 
            // gbSearch
            // 
            gbSearch.Controls.Add(cbChonDenNgay);
            gbSearch.Controls.Add(cbChonTuNgay);
            gbSearch.Controls.Add(cbNotPay);
            gbSearch.Controls.Add(txtToTotal);
            gbSearch.Controls.Add(txtFromTotal);
            gbSearch.Controls.Add(lbTotal);
            gbSearch.Controls.Add(btnClearSearch);
            gbSearch.Controls.Add(lbEmployee);
            gbSearch.Controls.Add(lbCustomer);
            gbSearch.Controls.Add(btnSearch);
            gbSearch.Controls.Add(cbPay);
            gbSearch.Controls.Add(txtEmployeeSearch);
            gbSearch.Controls.Add(txtCustomerSearch);
            gbSearch.Controls.Add(dtpToDate);
            gbSearch.Controls.Add(dtpFromDate);
            gbSearch.Controls.Add(lbToDate);
            gbSearch.Controls.Add(lbFromDate);
            gbSearch.Dock = DockStyle.Right;
<<<<<<< HEAD
            gbSearch.Location = new Point(621, 0);
            gbSearch.Margin = new Padding(3, 2, 3, 2);
            gbSearch.Name = "gbSearch";
            gbSearch.Padding = new Padding(3, 2, 3, 2);
            gbSearch.Size = new Size(515, 264);
=======
            gbSearch.Location = new Point(709, 0);
            gbSearch.Name = "gbSearch";
            gbSearch.Size = new Size(589, 352);
>>>>>>> main
            gbSearch.TabIndex = 1;
            gbSearch.TabStop = false;
            gbSearch.Text = "Tìm kiếm";
            // 
            // cbChonDenNgay
            // 
            cbChonDenNgay.AutoSize = true;
<<<<<<< HEAD
            cbChonDenNgay.Location = new Point(358, 58);
            cbChonDenNgay.Margin = new Padding(3, 2, 3, 2);
            cbChonDenNgay.Name = "cbChonDenNgay";
            cbChonDenNgay.Size = new Size(107, 19);
=======
            cbChonDenNgay.Location = new Point(409, 77);
            cbChonDenNgay.Name = "cbChonDenNgay";
            cbChonDenNgay.Size = new Size(130, 24);
>>>>>>> main
            cbChonDenNgay.TabIndex = 16;
            cbChonDenNgay.Text = "Chọn đến ngày";
            cbChonDenNgay.UseVisualStyleBackColor = true;
            cbChonDenNgay.CheckedChanged += cbChonDenNgay_CheckedChanged;
            // 
            // cbChonTuNgay
            // 
            cbChonTuNgay.AutoSize = true;
<<<<<<< HEAD
            cbChonTuNgay.Location = new Point(358, 25);
            cbChonTuNgay.Margin = new Padding(3, 2, 3, 2);
            cbChonTuNgay.Name = "cbChonTuNgay";
            cbChonTuNgay.Size = new Size(98, 19);
=======
            cbChonTuNgay.Location = new Point(409, 33);
            cbChonTuNgay.Name = "cbChonTuNgay";
            cbChonTuNgay.Size = new Size(119, 24);
>>>>>>> main
            cbChonTuNgay.TabIndex = 16;
            cbChonTuNgay.Text = "Chọn từ ngày";
            cbChonTuNgay.UseVisualStyleBackColor = true;
            cbChonTuNgay.CheckedChanged += cbChonTuNgay_CheckedChanged;
            // 
            // cbNotPay
            // 
            cbNotPay.AutoSize = true;
<<<<<<< HEAD
            cbNotPay.Location = new Point(145, 194);
            cbNotPay.Margin = new Padding(3, 2, 3, 2);
            cbNotPay.Name = "cbNotPay";
            cbNotPay.Size = new Size(115, 19);
=======
            cbNotPay.Location = new Point(166, 259);
            cbNotPay.Name = "cbNotPay";
            cbNotPay.Size = new Size(140, 24);
>>>>>>> main
            cbNotPay.TabIndex = 15;
            cbNotPay.Text = "Chưa thanh toán";
            cbNotPay.UseVisualStyleBackColor = true;
            cbNotPay.CheckedChanged += cbNotPay_CheckedChanged;
            // 
            // txtToTotal
            // 
<<<<<<< HEAD
            txtToTotal.Location = new Point(249, 156);
            txtToTotal.Margin = new Padding(3, 2, 3, 2);
=======
            txtToTotal.Location = new Point(285, 208);
>>>>>>> main
            txtToTotal.Name = "txtToTotal";
            txtToTotal.Size = new Size(106, 27);
            txtToTotal.TabIndex = 14;
            txtToTotal.Enter += txtToTotal_Enter;
            txtToTotal.KeyPress += txtToTotal_KeyPress;
            txtToTotal.Leave += txtToTotal_Leave;
            // 
            // txtFromTotal
            // 
<<<<<<< HEAD
            txtFromTotal.Location = new Point(123, 156);
            txtFromTotal.Margin = new Padding(3, 2, 3, 2);
=======
            txtFromTotal.Location = new Point(141, 208);
>>>>>>> main
            txtFromTotal.Name = "txtFromTotal";
            txtFromTotal.Size = new Size(106, 27);
            txtFromTotal.TabIndex = 14;
            txtFromTotal.Enter += txtFromTotal_Enter;
            txtFromTotal.KeyPress += txtFromTotal_KeyPress;
            txtFromTotal.Leave += txtFromTotal_Leave;
            // 
            // lbTotal
            // 
            lbTotal.AutoSize = true;
            lbTotal.Location = new Point(6, 211);
            lbTotal.Name = "lbTotal";
            lbTotal.Size = new Size(72, 20);
            lbTotal.TabIndex = 13;
            lbTotal.Text = "Tổng tiền";
            // 
            // btnClearSearch
            // 
            btnClearSearch.FlatAppearance.BorderSize = 0;
            btnClearSearch.FlatStyle = FlatStyle.Flat;
<<<<<<< HEAD
            btnClearSearch.Location = new Point(259, 219);
            btnClearSearch.Margin = new Padding(3, 2, 3, 2);
=======
            btnClearSearch.Location = new Point(296, 292);
>>>>>>> main
            btnClearSearch.Name = "btnClearSearch";
            btnClearSearch.Size = new Size(117, 53);
            btnClearSearch.TabIndex = 12;
            btnClearSearch.Text = "Tải lại";
            btnClearSearch.UseVisualStyleBackColor = true;
            btnClearSearch.Click += btnClearSearch_Click;
            // 
            // lbEmployee
            // 
            lbEmployee.AutoSize = true;
            lbEmployee.Location = new Point(6, 167);
            lbEmployee.Name = "lbEmployee";
            lbEmployee.Size = new Size(75, 20);
            lbEmployee.TabIndex = 11;
            lbEmployee.Text = "Nhân viên";
            // 
            // lbCustomer
            // 
            lbCustomer.AutoSize = true;
            lbCustomer.Location = new Point(6, 123);
            lbCustomer.Name = "lbCustomer";
            lbCustomer.Size = new Size(86, 20);
            lbCustomer.TabIndex = 10;
            lbCustomer.Text = "Khách hàng";
            // 
            // btnSearch
            // 
            btnSearch.FlatAppearance.BorderSize = 0;
            btnSearch.FlatStyle = FlatStyle.Flat;
<<<<<<< HEAD
            btnSearch.Location = new Point(142, 219);
            btnSearch.Margin = new Padding(3, 2, 3, 2);
=======
            btnSearch.Location = new Point(162, 292);
>>>>>>> main
            btnSearch.Name = "btnSearch";
            btnSearch.Size = new Size(117, 53);
            btnSearch.TabIndex = 9;
            btnSearch.Text = "Tìm kiếm";
            btnSearch.UseVisualStyleBackColor = true;
            btnSearch.Click += btnSearch_Click;
            // 
            // cbPay
            // 
            cbPay.AutoSize = true;
            cbPay.Location = new Point(6, 259);
            cbPay.Name = "cbPay";
            cbPay.Size = new Size(125, 24);
            cbPay.TabIndex = 7;
            cbPay.Text = "Đã thanh toán";
            cbPay.UseVisualStyleBackColor = true;
            cbPay.CheckedChanged += cbPay_CheckedChanged;
            // 
            // txtEmployeeSearch
            // 
<<<<<<< HEAD
            txtEmployeeSearch.Location = new Point(123, 123);
            txtEmployeeSearch.Margin = new Padding(3, 2, 3, 2);
=======
            txtEmployeeSearch.Location = new Point(141, 164);
>>>>>>> main
            txtEmployeeSearch.Name = "txtEmployeeSearch";
            txtEmployeeSearch.Size = new Size(250, 27);
            txtEmployeeSearch.TabIndex = 6;
            // 
            // txtCustomerSearch
            // 
<<<<<<< HEAD
            txtCustomerSearch.Location = new Point(123, 90);
            txtCustomerSearch.Margin = new Padding(3, 2, 3, 2);
=======
            txtCustomerSearch.Location = new Point(141, 120);
>>>>>>> main
            txtCustomerSearch.Name = "txtCustomerSearch";
            txtCustomerSearch.Size = new Size(250, 27);
            txtCustomerSearch.TabIndex = 5;
            // 
            // dtpToDate
            // 
<<<<<<< HEAD
            dtpToDate.Location = new Point(123, 57);
            dtpToDate.Margin = new Padding(3, 2, 3, 2);
=======
            dtpToDate.Location = new Point(141, 76);
>>>>>>> main
            dtpToDate.Name = "dtpToDate";
            dtpToDate.Size = new Size(250, 27);
            dtpToDate.TabIndex = 2;
            dtpToDate.KeyDown += dtpToDate_KeyDown;
            // 
            // dtpFromDate
            // 
<<<<<<< HEAD
            dtpFromDate.Location = new Point(123, 24);
            dtpFromDate.Margin = new Padding(3, 2, 3, 2);
=======
            dtpFromDate.Location = new Point(141, 32);
>>>>>>> main
            dtpFromDate.Name = "dtpFromDate";
            dtpFromDate.Size = new Size(250, 27);
            dtpFromDate.TabIndex = 1;
            dtpFromDate.KeyDown += dtpFromDate_KeyDown;
            // 
            // lbToDate
            // 
            lbToDate.AutoSize = true;
            lbToDate.Location = new Point(6, 79);
            lbToDate.Name = "lbToDate";
            lbToDate.Size = new Size(72, 20);
            lbToDate.TabIndex = 0;
            lbToDate.Text = "Đến ngày";
            // 
            // lbFromDate
            // 
            lbFromDate.AutoSize = true;
            lbFromDate.Location = new Point(6, 35);
            lbFromDate.Name = "lbFromDate";
            lbFromDate.Size = new Size(62, 20);
            lbFromDate.TabIndex = 0;
            lbFromDate.Text = "Từ ngày";
            // 
            // pnl_bottom
            // 
            pnl_bottom.Controls.Add(dgv_bill);
            pnl_bottom.Dock = DockStyle.Fill;
            pnl_bottom.Location = new Point(0, 352);
            pnl_bottom.Name = "pnl_bottom";
<<<<<<< HEAD
            pnl_bottom.Size = new Size(1136, 200);
=======
            pnl_bottom.Size = new Size(1298, 267);
>>>>>>> main
            pnl_bottom.TabIndex = 1;
            // 
            // dgv_bill
            // 
            dgv_bill.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dgv_bill.Dock = DockStyle.Fill;
            dgv_bill.Location = new Point(0, 0);
            dgv_bill.MultiSelect = false;
            dgv_bill.Name = "dgv_bill";
            dgv_bill.RowHeadersWidth = 51;
            dgv_bill.RowTemplate.Height = 29;
            dgv_bill.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
<<<<<<< HEAD
            dgv_bill.Size = new Size(1136, 200);
=======
            dgv_bill.Size = new Size(1298, 267);
>>>>>>> main
            dgv_bill.TabIndex = 0;
            dgv_bill.CellClick += dgv_bill_CellClick;
            dgv_bill.DoubleClick += dgv_bill_DoubleClick;
            // 
            // btnInHoaDon
            // 
            btnInHoaDon.Location = new Point(463, 163);
            btnInHoaDon.Name = "btnInHoaDon";
            btnInHoaDon.Size = new Size(75, 23);
            btnInHoaDon.TabIndex = 10;
            btnInHoaDon.Text = "In hóa đơn";
            btnInHoaDon.UseVisualStyleBackColor = true;
            btnInHoaDon.Click += btnInHoaDon_Click;
            // 
            // SaleForm
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
<<<<<<< HEAD
            ClientSize = new Size(1136, 464);
=======
            ClientSize = new Size(1298, 619);
>>>>>>> main
            Controls.Add(pnl_bottom);
            Controls.Add(pnl_top);
            Name = "SaleForm";
            Text = "SaleForm";
            Load += SaleForm_Load;
            pnl_top.ResumeLayout(false);
            pnlAddBill.ResumeLayout(false);
            pnlAddBtn.ResumeLayout(false);
            grbCustomerInfo.ResumeLayout(false);
            grbCustomerInfo.PerformLayout();
            gbSearch.ResumeLayout(false);
            gbSearch.PerformLayout();
            pnl_bottom.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)dgv_bill).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private Panel pnl_top;
        private Panel pnl_bottom;
        private DataGridView dgv_bill;
        private Button btnAddBill;
        private GroupBox gbSearch;
        private Label lbFromDate;
        private Label lbToDate;
        private DateTimePicker dtpToDate;
        private DateTimePicker dtpFromDate;
        private TextBox txtEmployeeSearch;
        private TextBox txtCustomerSearch;
        private CheckBox cbPay;
        private Panel pnlAddBill;
        private GroupBox grbCustomerInfo;
        private Panel pnlAddBtn;
        private ComboBox cbChooseCustomer;
        private Label lbChooseCustomer;
        private Label lbSex;
        private Label lbPhone;
        private Label lbCustomerName;
        private TextBox txtPhone;
        private TextBox txtCustomerName;
        private RadioButton rdFemale;
        private RadioButton rdMale;
        private TextBox txtSearchCustomer;
        private Button btnSearch;
        private CheckBox ckNewCustomer;
        private Button btnReset;
        private Label lbEmployee;
        private Label lbCustomer;
        private Button btnDelBill;
        private Button btnClearSearch;
        private Label lbTotal;
        private TextBox txtToTotal;
        private TextBox txtFromTotal;
<<<<<<< HEAD
        private CheckBox cbNotPay;
        private CheckBox cbChonTuNgay;
        private CheckBox cbChonDenNgay;
        private Button btnInHoaDon;
=======
        private Button btnDetalBill;
        private CheckBox cbNotPay;
        private CheckBox cbChonTuNgay;
        private CheckBox cbChonDenNgay;
>>>>>>> main
    }
}