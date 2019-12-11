package modeli;

public class Prijava {
    String imeprezime;
    String email;
    String vrijeme;
    String nacinprijave;

    public Prijava(String imeprezime, String email, String vrijeme, String nacinprijave) {
        this.imeprezime = imeprezime;
        this.email = email;
        this.vrijeme = vrijeme;
        this.nacinprijave = nacinprijave;
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

    public String getVrijeme() {
        return vrijeme;
    }

    public void setVrijeme(String vrijeme) {
        this.vrijeme = vrijeme;
    }

    public String getNacinprijave() {
        return nacinprijave;
    }

    public void setNacinprijave(String nacinprijave) {
        this.nacinprijave = nacinprijave;
    }
    
    
}
