package modeli;

public class KupljeniProizvod {
   String ime;
   float kol;
   float cijena;
   String nacinpl;
   String vrijeme;
   String imeprezime;
   String email;

    public KupljeniProizvod(String ime, float kol, float cijena, String nacinpl, String vrijeme) {
        this.ime = ime;
        this.kol = kol;
        this.cijena = cijena;
        this.nacinpl = nacinpl;
        this.vrijeme = vrijeme;
    }

    public String getImeprezime() {
        return imeprezime;
    }

    public void setImeprezime(String imeprezime) {
        this.imeprezime = imeprezime;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getIme() {
        return ime;
    }

    public void setIme(String ime) {
        this.ime = ime;
    }

    public float getKol() {
        return kol;
    }

    public void setKol(float kol) {
        this.kol = kol;
    }

    public float getCijena() {
        return cijena;
    }

    public void setCijena(float cijena) {
        this.cijena = cijena;
    }

    public String getNacinpl() {
        return nacinpl;
    }

    public void setNacinpl(String nacinpl) {
        this.nacinpl = nacinpl;
    }

    public String getVrijeme() {
        return vrijeme;
    }

    public void setVrijeme(String vrijeme) {
        this.vrijeme = vrijeme;
    }
   
   
}
