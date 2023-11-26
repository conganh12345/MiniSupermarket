﻿using MiniSupermarket.DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Linq;

namespace MiniSupermarket.BUS
{
    internal class ProductBUS
    {
        // Chứa dữ liệu lấy lên từ database
        private DataTable product;
        public ProductBUS()
        {
            product = getAllProduct();
        }

        private DataTable getAllProduct()
        {
            string storedProcedureName = "SelectAllFromProduct";
            return Connection.Execute(storedProcedureName, null);
        }
        public DataTable getAllProducts()
        {
            return getAllProduct();
        }
        // Nếu tồn tại trả về true, nếu không tồn tại trả về false
        public bool checkIdExist(string id)
        {
            // TypeID, Name
            foreach (DataRow row in product.Rows)
            {
                if (row["ProductID"].ToString() == id)
                {
                    return true;
                }
            }
            return false;
        }
        // Hàm tự tạo mã mới
        private string generateNewID()
        {
            int i = 1;
            string id;
            while (true)
            {
                id = "SP" + i.ToString();
                // Nếu ID chưa tồn tại
                if (!checkIdExist(id))
                {
                    return id;
                }
                ++i;
            }
        }
        // Lấy tất cả các tên  sp bỏ vào hộp gợi ý
        public string[] getNameForSuggestionBox()
        {
            List<string> names = new List<string>();

            foreach (DataRow row in product.Rows)
            {
                names.Add(row["Name"].ToString());
            }
            return names.ToArray();
        }
        // Lấy tất cả các mã loại sp bỏ vào hộp gợi ý
        public string[] getTypeIdForSuggestionBox()
        {
            List<string> names = new List<string>();

            foreach (DataRow row in product.Rows)
            {
                names.Add(row["TypeID"].ToString());
            }
            return names.ToArray();
        }
        // Lấy tất cả các mã sp bỏ vào hộp gợi ý
        public string[] getIdForSuggestionBox()
        {
            List<string> names = new List<string>();

            foreach (DataRow row in product.Rows)
            {
                names.Add(row["ProductID"].ToString());
            }
            return names.ToArray();
        }
        public bool addProduct(string name, string typeid, string quantity, string price, string des, string unit , string id=null)
        {
            // Nếu không nhập mã id thì sẽ tự tạo mã mới
            if (id == null)
            {
                id = generateNewID();
            }
            
            string storedProcedureName = "InsertIntoProduct";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@ProductID", id),
                new SqlParameter("@Name", name),
                new SqlParameter("@TypeID", typeid),
                new SqlParameter("@Quantity", quantity),
                new SqlParameter("@CurrentPrice", price),
                new SqlParameter("@Description",des),
                new SqlParameter("@Unit", unit),

                new SqlParameter("@PromotionID", DBNull.Value)
            };

            bool result = Connection.ExecuteNonQuery(storedProcedureName, parameters);

            // Nếu thêm thành công thì sẽ cập nhật lại danh sách
            if (result)
            {
                product = getAllProducts();
            }
            return result;
        }
        public bool deleteProduct(string id)
        {
            string storedProcedureName = "DeleteProduct";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@ProductID", id)
            };
            bool result = Connection.ExecuteNonQuery(storedProcedureName, parameters);
            // Nếu xóa thành công thì cập nhật lại danh sách
            if (result)
            {
                product = getAllProducts();
            }
            return result;
        }
        public bool updateProduct(string name, string id, string typeid, string quantity, string price, string des, string unit)
        {
            string storedProcedureName = "UpdateProduct";
            
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@ProductID", id),
                new SqlParameter("@Name", name),
                new SqlParameter("@TypeID", typeid),
                new SqlParameter("@Quantity", quantity),
                new SqlParameter("@CurrentPrice", price),
                new SqlParameter("@Description",des),
                new SqlParameter("@Unit", unit),
              
                new SqlParameter("@PromotionID", DBNull.Value)
            };
            bool result = Connection.ExecuteNonQuery(storedProcedureName, parameters);
            // Nếu cập nhật thành công thì cập nhật lại danh sách
            if (result)
            {
                product = getAllProducts();
            }
            return result;
        }

        //Lấy sản phẩm từ mã sản phẩm
        public DataTable getProductByID(string id)
        {
            DataTable result = new DataTable();
            DataRow rowTemp;
            // Thêm tên cột
            result.Columns.Add("ProductID", typeof(string));
            result.Columns.Add("Name", typeof(string));
            result.Columns.Add("TypeID", typeof(string));
            result.Columns.Add("Quantity", typeof(string));
            result.Columns.Add("CurrentPrice", typeof(string));
            result.Columns.Add("Description", typeof(string));
            result.Columns.Add("Unit", typeof(string));
            result.Columns.Add("PromotionID", typeof(string));

            foreach (DataRow row in product.Rows)
            {
                // Nếu dòng đó chứa ID như ID cần tìm thì thêm dòng đó vào result
                if (row["ProductID"].ToString().ToLower().Contains(id.ToLower()))
                {
                    // Thêm dữ liệu
                    rowTemp = result.NewRow();
                    rowTemp["ProductID"] = row["ProductID"].ToString();
                    rowTemp["Name"] = row["Name"].ToString();
                    rowTemp["TypeID"] = row["TypeID"].ToString();
                    rowTemp["Quantity"] = row["Quantity"].ToString();
                    rowTemp["CurrentPrice"] = row["CurrentPrice"].ToString();
                    rowTemp["Description"] = row["Description"].ToString();
                    rowTemp["Unit"] = row["Unit"].ToString();
                    rowTemp["PromotionID"] = row["PromotionID"].ToString();
                    result.Rows.Add(rowTemp);
                }
            }

            return result;
        }

        //Lấy sản phẩm từ ten sản phẩm
        public DataTable getProductsByProductName(string name)
        {
            DataTable result = new DataTable();
            DataRow rowTemp;
            // Thêm tên cột
            result.Columns.Add("ProductID", typeof(string));
            result.Columns.Add("Name", typeof(string));
            result.Columns.Add("TypeID", typeof(string));
            result.Columns.Add("Quantity", typeof(string));
            result.Columns.Add("CurrentPrice", typeof(string));
            result.Columns.Add("Description", typeof(string));
            result.Columns.Add("Unit", typeof(string));
            result.Columns.Add("PromotionID", typeof(string));

            foreach (DataRow row in product.Rows)
            {
                // Nếu dòng đó chứa name như name cần tìm thì thêm dòng đó vào result
                if (row["Name"].ToString().ToLower().Contains(name.ToLower()))
                {
                    // Thêm dữ liệu
                    rowTemp = result.NewRow();
                    rowTemp["ProductID"] = row["ProductID"].ToString();
                    rowTemp["Name"] = row["Name"].ToString();
                    rowTemp["TypeID"] = row["TypeID"].ToString();
                    rowTemp["Quantity"] = row["Quantity"].ToString();
                    rowTemp["CurrentPrice"] = row["CurrentPrice"].ToString();
                    rowTemp["Description"] = row["Description"].ToString();
                    rowTemp["Unit"] = row["Unit"].ToString();
                    rowTemp["PromotionID"] = row["PromotionID"].ToString();
                    result.Rows.Add(rowTemp);
                }
            }

            return result;
        }
        //Lấy sản phẩm từ mã loại sản phẩm
        public DataTable getProductsByTypeID(string typeId)
        {
            DataTable result = new DataTable();
            DataRow rowTemp;
            // Thêm tên cột
            result.Columns.Add("ProductID", typeof(string));
            result.Columns.Add("Name", typeof(string));
            result.Columns.Add("TypeID", typeof(string));
            result.Columns.Add("Quantity", typeof(string));
            result.Columns.Add("CurrentPrice", typeof(string));
            result.Columns.Add("Description", typeof(string));
            result.Columns.Add("Unit", typeof(string));
            result.Columns.Add("PromotionID", typeof(string));

            foreach (DataRow row in product.Rows)
            {
                // Nếu dòng đó chứa TypeID như TypeID cần tìm thì thêm dòng đó vào result
                if (row["TypeID"].ToString().ToLower().Contains(typeId.ToLower()))
                {
                    // Thêm dữ liệu
                    rowTemp = result.NewRow();
                    rowTemp["ProductID"] = row["ProductID"].ToString();
                    rowTemp["Name"] = row["Name"].ToString();
                    rowTemp["TypeID"] = row["TypeID"].ToString();
                    rowTemp["Quantity"] = row["Quantity"].ToString();
                    rowTemp["CurrentPrice"] = row["CurrentPrice"].ToString();
                    rowTemp["Description"] = row["Description"].ToString();
                    rowTemp["Unit"] = row["Unit"].ToString();
                    rowTemp["PromotionID"] = row["PromotionID"].ToString();
                    result.Rows.Add(rowTemp);
                }
            }

            return result;
        }

    }
}
