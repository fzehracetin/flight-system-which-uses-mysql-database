
public class Yolcu {
	private int yolcu_id;
	private String tc;
	private String dogum_tarihi;
	private String isim;
	private String soyisim;
	private String uyruk;
	private String cinsiyet;
	private String telefon;
	private int yolcu_tipi;
	
	public Yolcu(String tc, String dogum_tarihi, String isim, String soyisim, String uyruk,
			String cinsiyet, String telefon, int yolcu_tipi, int yolcu_id) {
		this.tc = tc;
		this.dogum_tarihi = dogum_tarihi;
		this.isim = isim;
		this.soyisim = soyisim;
		this.uyruk = uyruk;
		this.cinsiyet = cinsiyet;
		this.telefon = telefon;
		this.yolcu_tipi = yolcu_tipi;
		this.yolcu_id = yolcu_id;
	}


	public int getYolcu_id() {
		return yolcu_id;
	}


	public String getTc() {
		return tc;
	}

	public String getDogum_tarihi() {
		return dogum_tarihi;
	}

	public String getIsim() {
		return isim;
	}

	public String getSoyisim() {
		return soyisim;
	}

	public String getUyruk() {
		return uyruk;
	}

	public String getCinsiyet() {
		return cinsiyet;
	}

	public String getTelefon() {
		return telefon;
	}

	public int getYolcu_tipi() {
		return yolcu_tipi;
	}

	@Override
	public String toString() {
		return "Yolcu [ tc=" + tc + ", dogum_tarihi=" + dogum_tarihi + ", isim=" + isim
				+ ", soyisim=" + soyisim + ", uyruk=" + uyruk + ", cinsiyet=" + cinsiyet + ", telefon=" + telefon
				+ ", yolcu_tipi=" + yolcu_tipi + "]";
	}
	
}
