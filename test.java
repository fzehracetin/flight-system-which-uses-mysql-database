
public class test {
	public static void main (String[] args) {
		Connector c = new Connector();
		Kullanici p = c.kullaniciGirisi("fzehracetin@gmail.com", "123456");
		//Kullanici p = c.kullaniciOlustur("dilara.suveren@gmail.com", "1234", "DILARA", "SUVEREN", "TC", "K", "45049502054", "1997-06-12", "05444361367", "OGRENCI");
		//Yolcu p = c.yolcuOlustur("DILARA", "SUVEREN", "TC", "K", "45049502034", "1997-06-12", "05344361367", "OGRENCI");
		System.out.println(p.toString());
		//c.ucusGoruntule("ankara", "izmir", "2019-05-07");
		//Ucus ucus = c.ucusSec("THY100", "2019-05-07");
		//System.out.println(ucus.toString());
		//System.out.println(ucus.getUcak_id());
		//Bilet bilet = c.biletOlustur(ucus, "BUSINESS", p, null);
	}
}
