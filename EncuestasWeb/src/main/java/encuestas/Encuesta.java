package encuestas;

public class Encuesta {
    private int sonido;
    private int imagen;
    private int facilidadUso;

    // Constructor
    public Encuesta(int sonido, int imagen, int facilidadUso) {
        this.sonido = sonido;
        this.imagen = imagen;
        this.facilidadUso = facilidadUso;
    }

    // Getters y Setters
    public int getSonido() { return sonido; }
    public void setSonido(int sonido) { this.sonido = sonido; }

    public int getImagen() { return imagen; }
    public void setImagen(int imagen) { this.imagen = imagen; }

    public int getFacilidadUso() { return facilidadUso; }
    public void setFacilidadUso(int facilidadUso) { this.facilidadUso = facilidadUso; }

    // Sobreescribir toString() para mostrar los detalles de la encuesta
    @Override
    public String toString() {
        return "Encuesta [sonido=" + sonido + ", imagen=" + imagen + ", facilidadUso=" + facilidadUso + "]";
    }

    // Método para calcular la media de los tres aspectos
    public double calcularMedia() {
        return (sonido + imagen + facilidadUso) / 3.0;
    }
}
