package modeli;


public class Proizvod {
    int id;
    String ime;
    float kolicina;
    float cijena;
    int idkat;

    public Proizvod(int id, String ime, float kolicina, float cijena, int idkat) {
        this.id = id;
        this.ime = ime;
        this.kolicina = kolicina;
        this.cijena = cijena;
        this.idkat = idkat;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIme() {
        return ime;
    }

    public void setIme(String ime) {
        this.ime = ime;
    }

    public float getKolicina() {
        return kolicina;
    }

    public void setKolicina(float kolicina) {
        this.kolicina = kolicina;
    }

    public float getCijena() {
        return cijena;
    }

    public void setCijena(float cijena) {
        this.cijena = cijena;
    }

    public int getIdkat() {
        return idkat;
    }

    public void setIdkat(int idkat) {
        this.idkat = idkat;
    }
  
    
}
