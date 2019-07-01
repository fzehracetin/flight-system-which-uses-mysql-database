
public class Kullanici extends Yolcu{
	
	private String email;
	private String sifre;
	
	public Kullanici(String tc, String dogum_tarihi, String isim, String soyisim, String uyruk, String cinsiyet,
			String telefon, int yolcu_tipi, String email, String sifre, int yolcu_id) {
		super(tc, dogum_tarihi, isim, soyisim, uyruk, cinsiyet, telefon, yolcu_tipi, yolcu_id);
		this.email = email;
		this.sifre = sifre;
	}

	public String getEmail() {
		return email;
	}

	public String getSifre() {
		return sifre;
	}
	
}

