
import com.sun.istack.internal.logging.Logger;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import javax.swing.JTable;


public class Ucus {
	private String ucak_id;
	private int kalkis_id;
	private int varis_id;
	private String tarih;
	private int ucus_id;
	private String varis_tarihi;
	private int koltuk_id;
	private int business;
	private int ekonomi;
	
	public Ucus(String ucak_id, int kalkis_id, int varis_id, String tarih, int ucus_id, String varis_tarihi,
			int koltuk_id, int business, int ekonomi) {
		this.ucak_id = ucak_id;
		this.kalkis_id = kalkis_id;
		this.varis_id = varis_id;
		this.tarih = tarih;
		this.ucus_id = ucus_id;
		this.varis_tarihi = varis_tarihi;
		this.koltuk_id = koltuk_id;
		this.business = business;
		this.ekonomi = ekonomi;
	}

	public String getUcak_id() {
		return ucak_id;
	}

	public int getKalkis_id() {
		return kalkis_id;
	}

	public int getVaris_id() {
		return varis_id;
	}

	public String getTarih() {
		return tarih;
	}

	public int getUcus_id() {
		return ucus_id;
	}

	public String getVaris_tarihi() {
		return varis_tarihi;
	}

	public int getKoltuk_id() {
		return koltuk_id;
	}

	public int getBusiness() {
		return business;
	}

	public int getEkonomi() {
		return ekonomi;
	}

	@Override
	public String toString() {
		return "Ucus [ucak_id=" + ucak_id + ", kalkis_id=" + kalkis_id + ", varis_id=" + varis_id + ", tarih=" + tarih
				+ ", ucus_id=" + ucus_id + ", varis_tarihi=" + varis_tarihi + ", koltuk_id=" + koltuk_id + ", business="
				+ business + ", ekonomi=" + ekonomi + "]";
	}
}      
//	public void fillUcusJTable(JTable table,String valueToSearch) throws SQLException{
  //          Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/giraffe?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey", "root", "1234");