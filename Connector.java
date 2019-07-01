
import java.sql.*;

public class Connector {
	String url = "jdbc:mysql://localhost:3306/giraffe?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey";
	String username = "root";
	String password = "1234";
	Connection myConn = null;
	private static final String ALPHA_NUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	
	public Connector() {
		this.myConn = connector();
	}
	
	private Connection connector() {
		try {
			Connection myConn = DriverManager.getConnection(url, username, password);
			System.out.println("Success");
			return myConn;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Kullanici kullaniciGirisi (String email, String sifre) {
		try {
			PreparedStatement myStmt = ((Connection) myConn).prepareStatement("select * from kullanici where email = ?");
			myStmt.setString(1, email);
			ResultSet myRs = myStmt.executeQuery();
			if (myRs.next()) {
				if(myRs.getString("sifre").equals(sifre)) {
					System.out.println("Giriş başarılı!");
					Kullanici p = new Kullanici(myRs.getString("tc"), myRs.getString("dogum_tarihi"),myRs.getString("isim"),
							myRs.getString("soyisim"),myRs.getString("uyruk"),myRs.getString("cinsiyet"), 
							myRs.getString("telefon"), myRs.getInt("kullanici_tipi"), myRs.getString("email"), 
							myRs.getString("sifre"), myRs.getInt("kullanici_id"));
					return p;
				}	
			}
			else {
				System.out.println("Hatalı giriş yaptınız. . .");
				return null;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	public Kullanici kullaniciOlustur(String email, String sifre, String isim, String soyisim, String uyruk, String cinsiyet, String tc,
			String dogum_tarihi, String telefon, String kullanici_tipi) {
		Kullanici p = null;
		try {
			PreparedStatement stmt = myConn.prepareStatement("select tip_id from yolcu_tipi where tip = ?");
			stmt.setString(1, kullanici_tipi);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {}; 
			PreparedStatement stmt1 = myConn.prepareStatement("insert into kullanici (email, sifre, isim, soyisim, uyruk, cinsiyet, "
					+ "tc, dogum_tarihi, telefon, kullanici_tipi) "
					+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			
			stmt1.setString(1, email);
			stmt1.setString(2, sifre);
			stmt1.setString(3, isim);
			stmt1.setString(4, soyisim);
			stmt1.setString(5, uyruk);
			stmt1.setString(6, cinsiyet);
			stmt1.setString(7, tc);
			stmt1.setString(8, dogum_tarihi);
			stmt1.setString(9, telefon);
			stmt1.setInt(10, rs.getInt("tip_id"));
			stmt1.executeUpdate();
			try {
				PreparedStatement stmt2 = myConn.prepareStatement("select * from kullanici where email = ?");
				stmt2.setString(1, email);
				ResultSet myRs = stmt2.executeQuery();
				
				if( myRs.next() ) {
					p = new Kullanici(myRs.getString("tc"), myRs.getString("dogum_tarihi"),myRs.getString("isim"),
							myRs.getString("soyisim"),myRs.getString("uyruk"),myRs.getString("cinsiyet"), 
							myRs.getString("telefon"), myRs.getInt("kullanici_tipi"), myRs.getString("email"), 
							myRs.getString("sifre"), myRs.getInt("kullanici_id"));
				}
				myRs.close();
				rs.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return p;
		
	}
	
	public void ucusGoruntule(String nereden, String nereye, String tarih) {
		int flag = 0;
		try {
			PreparedStatement stmt = myConn.prepareStatement("select * from ucus where kalkis_id in "
					+ "(select ucus_noktasi.liman_id from ucus_noktasi where ucus_noktasi.sehir = ?) "
					+ "and varis_id in "
					+ "(select ucus_noktasi.liman_id from ucus_noktasi where ucus_noktasi.sehir = ?) "
					+ "and tarih like ?");
			stmt.setString(1, nereden.toUpperCase());
			stmt.setString(2,  nereye.toUpperCase());
			stmt.setString(3, tarih + "%");
			ResultSet rs = stmt.executeQuery();
		
			while ( rs.next() ) {
				System.out.println(rs.getString("ucak_id") + ", " + rs.getString("tarih") + ", "+ rs.getString("varis_tarihi") );
				flag = 1;
			}
			if ( flag == 0)
				System.out.println("Böyle bir uçuş bulunamadı!");
			rs.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public Ucus ucusSec(String ucak_id, String tarih) {
		try {
			PreparedStatement stmt = myConn.prepareStatement("select * from ucus where ucak_id = ? and tarih like ?");
			stmt.setString(1, ucak_id.toUpperCase());
			stmt.setString(2, tarih + "%");
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				Ucus ucus = new Ucus(rs.getString("ucak_id"), rs.getInt("kalkis_id"), 
						rs.getInt("varis_id"), rs.getString("tarih"), rs.getInt("ucus_id"), 
						rs.getString("varis_tarihi"), rs.getInt("koltuk_id"), 
						rs.getInt("business"), rs.getInt("ekonomi"));
				return ucus;
			}
		}
		catch (Exception e ) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Bilet biletOlustur(Ucus ucus, String sinif, Kullanici kullanici, Yolcu yolcu) throws YetersizKoltukException {
		try {
			Bilet bilet = null;
			PreparedStatement stmt1 = myConn.prepareStatement("select * from sinif where ad = ?");
			stmt1.setString(1, sinif.toUpperCase());
			ResultSet rs1 = stmt1.executeQuery();
			if( rs1.next()) {};
			try {
				PreparedStatement myStmt = myConn.prepareStatement("select * from ucus where ucus_id = ?");
				myStmt.setInt(1, ucus.getUcus_id());
				ResultSet myRss = myStmt.executeQuery();
				if (myRss.next()) {
					if ( (myRss.getInt(sinif) == 0) ) 
						throw new YetersizKoltukException("Bu sınıftaki tüm koltuklar dolu ! ");
				}
				
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			if (yolcu == null) {
				try {
					PreparedStatement stmt2 = myConn.prepareStatement("select * from fiyat where tip_id = ? and sinif_id= ? ");
					stmt2.setInt(1, kullanici.getYolcu_tipi());
					stmt2.setInt(2, rs1.getInt("sinif_id"));
					ResultSet rs2 = stmt2.executeQuery();
					
					if( rs2.next()) {};
					PreparedStatement stmt3 = myConn.prepareStatement("insert into bilet(pnr, ucus_id, kullanici_id, fiyat_id, sinif_id) "
							+ "values (?,?,?,?,?) ");
					stmt3.setString(1, randomAlphaNumeric(6));
					stmt3.setInt(2, ucus.getUcus_id());
					stmt3.setInt(3, kullanici.getYolcu_id());
					stmt3.setInt(4, rs2.getInt("fiyat_id"));
					stmt3.setInt(5, rs1.getInt("sinif_id"));
					stmt3.executeUpdate();
					
					try {
						PreparedStatement stmt = myConn.prepareStatement("select * from bilet");
						ResultSet myRs = stmt.executeQuery();
						if (myRs.next()) 
							bilet = new Bilet(myRs.getString("pnr"), myRs.getInt("ucus_id"),  myRs.getInt("kullanici_id"), 0, myRs.getInt("fiyat_id"), myRs.getInt("sinif_id"));
						myRs.close();
					}
					catch (Exception e) {
						e.printStackTrace();
					}
					rs2.close();
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			}
			else {
				try {
					PreparedStatement stmt2 = myConn.prepareStatement("select * from fiyat where tip_id = ? and sinif_id= ? ");
					stmt2.setInt(1, yolcu.getYolcu_tipi());
					stmt2.setInt(2, rs1.getInt("sinif_id"));
					ResultSet rs2 = stmt2.executeQuery();
					
					if( rs2.next()) {};
					PreparedStatement stmt3 = myConn.prepareStatement("insert into bilet(pnr, ucus_id, yolcu_id, fiyat_id, sinif_id) "
							+ "values (?,?,?,?,?) ");
					stmt3.setString(1, randomAlphaNumeric(6));
					stmt3.setInt(2, ucus.getUcus_id());
					stmt3.setInt(3, yolcu.getYolcu_id());
					stmt3.setInt(4, rs2.getInt("fiyat_id"));
					stmt3.setInt(5, rs1.getInt("sinif_id"));
					stmt3.executeUpdate();
					try {
						PreparedStatement stmt = myConn.prepareStatement("select * from bilet");
						ResultSet myRs = stmt.executeQuery();
						if (myRs.next()) 
							bilet = new Bilet(myRs.getString("pnr"), myRs.getInt("ucus_id"),  myRs.getInt("yolcu_id"), 0, myRs.getInt("fiyat_id"), myRs.getInt("sinif_id"));
						myRs.close();
					}
					catch (Exception e) {
						e.printStackTrace();
					}
					rs2.close();
				}
				catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			rs1.close();
			return bilet;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
	
	return null;
	}
	
	public Yolcu yolcuOlustur(String isim, String soyisim, String uyruk, String cinsiyet, String tc, String dogum_tarihi, String telefon, String kullanici_tipi) {
		try {
			Yolcu yolcu = null;
			PreparedStatement stmt1 = myConn.prepareStatement("select tip_id from yolcu_tipi where tip = ?");
			stmt1.setString(1, kullanici_tipi);
			ResultSet rs1 = stmt1.executeQuery();
			if (rs1.next()) {}
			PreparedStatement stmt = myConn.prepareStatement("insert into yolcu(tc, dogum_tarihi, isim, "
					+ "soyisim, uyruk, cinsiyet, telefon, yolcu_tipi) VALUES(?,?,?,?,?,?,?,?)");
			stmt.setString(1, tc);
			stmt.setString(2, dogum_tarihi);
			stmt.setString(3, isim);
			stmt.setString(4, soyisim);
			stmt.setString(5, uyruk);
			stmt.setString(6, cinsiyet);
			stmt.setString(7, telefon);
			stmt.setInt(8, rs1.getInt("tip_id"));
			stmt.executeUpdate();
			try {
				PreparedStatement stmt2 = myConn.prepareStatement("select * from yolcu where tc = ?");
				stmt2.setString(1, tc);
				ResultSet rs = stmt2.executeQuery();
				if (rs.next()) {};
				yolcu = new Yolcu (rs.getString("tc"), rs.getString("dogum_tarihi"), rs.getString("isim"), 
						rs.getString("soyisim"), rs.getString("uyruk"), rs.getString("cinsiyet"), 
						rs.getString("telefon"), rs.getInt("yolcu_tipi"), rs.getInt("yolcu_id"));
				
				rs.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			rs1.close();
			return yolcu;
		}
		catch (Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public static String randomAlphaNumeric(int count) {
	    StringBuilder builder = new StringBuilder();
	        while (count-- != 0) {
	        int character = (int)(Math.random()*ALPHA_NUMERIC_STRING.length());
	        builder.append(ALPHA_NUMERIC_STRING.charAt(character));
	        }
	    return builder.toString();
	}

	
	
	

}
