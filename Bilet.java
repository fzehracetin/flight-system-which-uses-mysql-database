

public class Bilet {
	private String pnr;
	private int ucus_id;
	private int kullanici_id;
	private int yolcu_id;
	private int fiyat_id;
	private int sinif_id;
	
	public Bilet(String pnr, int ucus_id, int kullanici_id, int yolcu_id, int fiyat_id, int sinif_id) {
		this.pnr = pnr;
		this.ucus_id = ucus_id;
		this.kullanici_id = kullanici_id;
		this.yolcu_id = yolcu_id;
		this.fiyat_id = fiyat_id;
		this.sinif_id = sinif_id;
	}

	public String getPnr() {
		return pnr;
	}

	public int getUcus_id() {
		return ucus_id;
	}

	public int getKullanici_id() {
		return kullanici_id;
	}

	public int getYolcu_id() {
		return yolcu_id;
	}

	public int getFiyat_id() {
		return fiyat_id;
	}

	public int getSinif_id() {
		return sinif_id;
	}

	@Override
	public String toString() {
		return "Bilet [pnr=" + pnr + ", ucus_id=" + ucus_id + ", kullanici_id=" + kullanici_id + ", yolcu_id="
				+ yolcu_id + ", fiyat_id=" + fiyat_id + ", sinif_id=" + sinif_id + "]";
	}
	
	
	
	

}
