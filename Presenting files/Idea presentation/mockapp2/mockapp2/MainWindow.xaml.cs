using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace mockapp2
{
	public class SqlData
	{
		public string conn_str = @"Data Source=MARTIN4ATA\SQLEXPRESS;Initial Catalog=Bank-testing;Integrated Security=True";
		public Func<SqlDataReader, int, string> SafeGetString = (SqlDataReader reader, int colIndex) =>
		{
			if (reader.HasRows == false)
				return string.Empty;
			if (!reader.IsDBNull(colIndex))
				return reader.GetString(colIndex);
			return string.Empty;
		};
		public Func<SqlDataReader, int, int> SafeGetInt = (SqlDataReader reader, int colIndex) =>
		{
			if (reader.HasRows == false)
				return 0;
			if (!reader.IsDBNull(colIndex))
				return reader.GetInt32(colIndex);
			return 0;
		};
		public Func<SqlDataReader, int, decimal> SafeGetDecimal = (SqlDataReader reader, int colIndex) =>
		{
			if (reader.HasRows == false)
				return 0;
			if (!reader.IsDBNull(colIndex))
				return reader.GetDecimal(colIndex);
			return 0;
		};
	}

	/// <summary>
	/// Interaction logic for MainWindow.xaml
	/// </summary>
	public partial class MainWindow : Window
	{
		public MainWindow()
		{
			InitializeComponent();
		}

		private void Generic_Click(object sender, RoutedEventArgs e)
		{

		}
	}
}
