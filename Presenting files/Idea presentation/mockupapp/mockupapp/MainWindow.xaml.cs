using System;
using System.Collections.Generic;
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
using System.Collections.ObjectModel;
using System.Data.SqlClient;
using System.Security.Principal;

namespace mockupapp
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

	public class TransactionData
	{
		public TransactionData() { }

		public TransactionData(int id, int from, int to, decimal amount, String? reason)
		{
			this.id = id;
			this.from = from;
			this.to = to;
			this.amount = amount;
			this.reason = reason;

			SqlData hndl = new SqlData();
			SqlConnection conn = new SqlConnection(hndl.conn_str);

			SqlCommand comm = new SqlCommand($"SELECT us.[name]\n" +
				$"FROM Users us JOIN Account\n" +
				$"On us.id = Account.holder\n" +
				$"WHERE Account.holder = @HolderId", conn);
			comm.Parameters.AddWithValue("@HolderId", this.from);

			conn.Open();

			SqlDataReader reader = comm.ExecuteReader();
			reader.Read();						  
			namefrom = hndl.SafeGetString(reader, 0);

			comm.Parameters.Clear();
			comm.Parameters.AddWithValue("@HolderId", this.to);

			reader.Close();
			reader = comm.ExecuteReader();
			reader.Read();
			nameto = hndl.SafeGetString(reader, 0);
			reader.Close();

			conn.Close();
		}

		public int id { get; set; }
		public int from { get; set; }
		public String namefrom { get; set; }
		public int to { get; set; }
		public String nameto { get; set; }
		public decimal amount { get; set; }
		public String? reason { get; set; }
	}

	/// <summary>
	/// Interaction logic for MainWindow.xaml
	/// </summary>
	public partial class MainWindow : Window
	{
		public MainWindow()
		{
			InitializeComponent();
			UpdateTransactions();
		}

		private void UpdateTransactions()
		{
			SqlData hndl = new SqlData();
			SqlConnection conn = new SqlConnection(hndl.conn_str);

			SqlCommand comm = new SqlCommand(
	$"SELECT id, from_acc, to_acc, amount, reason\n" +
	$"FROM Transactions\n" +
	$"WHERE reason IS NOT NULL", conn);

			conn.Open();

			SqlDataReader reader = comm.ExecuteReader();

			ObservableCollection<TransactionData> arr = new ObservableCollection<TransactionData>();

			while (reader.Read())
				arr.Add(new TransactionData(
					hndl.SafeGetInt(reader, 0),
					hndl.SafeGetInt(reader, 1),
					hndl.SafeGetInt(reader, 2),
					hndl.SafeGetDecimal(reader, 3),
					hndl.SafeGetString(reader, 4)));

			//SqlCommand comm = new SqlCommand(
			//	$"SELECT id, from_acc, to_acc, amount, reason\n" +
			//	$"FROM Transactions\n" +
			//	$"WHERE reason IS NOT NULL", conn);

			//conn.Open();

			//SqlDataReader reader = comm.ExecuteReader();

			//ObservableCollection<TransactionData> arr = new ObservableCollection<TransactionData>();

			//while (reader.Read())
			//	arr.Add(new TransactionData(
			//		SafeGetInt(reader, 0),
			//		SafeGetInt(reader, 1),
			//		SafeGetInt(reader, 2),
			//		SafeGetDecimal(reader, 3),
			//		SafeGetString(reader, 4)));

			TransactionsLog.ItemsSource = null;
			TransactionsLog.Items.Clear();
			TransactionsLog.DataContext = this;
			TransactionsLog.ItemsSource = arr;

			conn.Close();
		}

		private void Button_Click(object sender, RoutedEventArgs e)
		{
			UpdateTransactions();
		}
	}
}
