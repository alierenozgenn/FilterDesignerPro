[bilg müh özel konular dönem içi proj.pdf](https://github.com/user-attachments/files/17968549/bilg.muh.ozel.konular.donem.ici.proj.pdf)

# FilterDesignerPro

FilterDesignerPro, Butterworth, Chebyshev ve Ters Chebyshev (Chebyshev-II) yöntemleriyle filtre tasarımı yapmayı sağlayan bir MATLAB projesidir. Proje, düşük geçiren (LPF), yüksek geçiren (HPF) ve bant geçiren (BPF) filtreler için normalize ve denormalize işlemleri gerçekleştirir. Ayrıca, filtrelerin genlik-frekans grafikleri görselleştirilir.

## 🚀 Özellikler
- **Normalize Filtre Tasarımı:** 
  - Butterworth
  - Chebyshev
  - Ters Chebyshev (Chebyshev-II)
- **Denormalize Filtre Dönüşümleri:**
  - Düşük Geçiren (LPF)
  - Yüksek Geçiren (HPF)
  - Bant Geçiren (BPF)
- **Frekans Tepki Grafikleri:**
  - Tasarlanan filtrelerin frekans tepkilerini dB cinsinden görselleştirir.

## 📁 Dosya Yapısı
- `FilterDesignerPro.m`: Ana MATLAB kod dosyası.
- `README.md`: Proje hakkında açıklamalar ve kullanım rehberi.

## 🛠️ Kurulum
Bu projeyi kullanabilmek için MATLAB kurulu olmalıdır.

1. **Bu repoyu klonlayın:**
   ```bash
   git clone https://github.com/kullaniciadi/FilterDesignerPro.git

MATLAB'da Projeyi Açın:
FilterDesignerPro.m dosyasını MATLAB'da açın ve çalıştırın.
🔧 Kullanım
n değişkeni ile filtre derecesini ayarlayın:

matlab

    n = 6; % Filtre derecesi (4, 6 veya istediğiniz başka bir değer)

epsilon_chebyshev, epsilon_inv_chebyshev, lpf_wp, hpf_wp, bpf_wc, bpf_bw gibi parametreleri düzenleyerek filtre özelliklerini tanımlayın.

MATLAB konsolunda FilterDesignerPro.m dosyasını çalıştırarak:

Normalize filtreleri tasarlayın,
Denormalize filtreleri dönüştürün,
Frekans tepkilerini görselleştirin.
📊 Örnek Grafikler
Aşağıda proje tarafından üretilen grafiklerin bir örneği verilmiştir:

LPF Genlik-Frekans Grafiği

HPF Genlik-Frekans Grafiği

BPF Genlik-Frekans Grafiği

💡 Notlar
Frekans aralığı, projede belirtilen tasarım gereksinimlerine göre ayarlanmıştır. Daha fazla hassasiyet için f ve w değerlerini düzenleyebilirsiniz.
Eğer filtrelerin geçiş bölgeleri veya davranışında sorun yaşarsanız, tasarım parametrelerini (örneğin epsilon) kontrol edin.
