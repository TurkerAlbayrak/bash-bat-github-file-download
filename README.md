# GitHub Upload Tool

Klasör yolu ve GitHub repo URL'si girerek projenizi tek tıkla GitHub'a yükleyin.

---

##  Kullanım

1. `github_upload.bat` dosyasını indirin
2. Çift tıklayarak çalıştırın
3. İstenilen bilgileri girin:

```
Proje klasörünün tam yolunu girin : C:\Users\Turker\Desktop\ProjeAdi
GitHub repo URL girin             : https://github.com/kullanici/repo-adi
Commit mesajı                     : Initial commit
```

Hepsi bu kadar. 

---

## Nasıl Çalışır?

```
git init → remote ekle → git add . → git commit → git push
```

---

## Gereksinimler

- [Git](https://git-scm.com/downloads) kurulu olmalı
- GitHub kimlik bilgileri tanımlı olmalı:

```bash
git config --global user.name "Ad Soyad"
git config --global user.email "email@example.com"
```

- GitHub repo **boş** oluşturulmuş olmalı (README olmadan)

---
