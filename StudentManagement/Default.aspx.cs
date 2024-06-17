using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using Ext.Net;

namespace StudentManagement
{
    public partial class Default : System.Web.UI.Page
    {
        private string connectionString = WebConfigurationManager.ConnectionStrings["SchoolDBConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            Store1.DataSource = GetStudentData();
            Store1.DataBind();
        }

        private DataTable GetStudentData()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Student", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        [DirectMethod]
        protected void btnAdd_Click(object sender, DirectEventArgs e)
        {
            string newSId = "04"; // 这个应该从前端获取，这里简化处理
            string newSname = "王五"; // 这个应该从前端获取，这里简化处理
            string newSage = "1991-05-01"; // 这个应该从前端获取，这里简化处理
            string newSsex = "男"; // 这个应该从前端获取，这里简化处理

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Student (SId, Sname, Sage, Ssex) VALUES (@SId, @Sname, @Sage, @Ssex)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@SId", newSId);
                cmd.Parameters.AddWithValue("@Sname", newSname);
                cmd.Parameters.AddWithValue("@Sage", newSage);
                cmd.Parameters.AddWithValue("@Ssex", newSsex);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            BindGrid();
        }
    }
}
