from django.db import models

class master_kategori(models.Model):
    kategori_id = models.AutoField(primary_key=True)
    kode = models.CharField(max_length=200)
    nama = models.CharField(max_length=200)
    def __str__(self):
        return self.nama

class master_unit(models.Model):
    unit_id = models.AutoField(primary_key=True)
    satuan = models.CharField(max_length=200)
    def __str__(self):
        return self.satuan

class master_merk(models.Model):
    merk_id = models.AutoField(primary_key=True)
    merk = models.CharField(max_length=200)

    def __str__(self):
        return self.merk

class master_location(models.Model):
    location_id = models.AutoField(primary_key=True)
    type = models.CharField(max_length=150)
    code = models.CharField(max_length=100)
    name = models.CharField(max_length=200)
    def __str__(self):
        return self.name

class master_vendor(models.Model):
    vendor_id = models.AutoField(primary_key=True)
    nama = models.CharField(max_length=200)
    alamat = models.CharField(max_length=1000)
    def __str__(self):
        return self.nama

class master_pelanggan(models.Model):
    pelanggan_id = models.AutoField(primary_key=True)
    tipe = models.CharField(max_length=200)
    nama = models.CharField(max_length=200)
    alamat = models.CharField(max_length=1000)
    kode_pos = models.IntegerField()
    telepon = models.CharField(max_length=100)
    fax = models.CharField(max_length=100)
    hp = models.CharField(max_length=100)
    nama_pj = models.CharField(max_length=200)
    hp_pj = models.CharField(max_length=100)
    def __str__(self):
        return self.nama

class master_barang(models.Model):
    barang_id = models.AutoField(primary_key=True)
    kode  = models.CharField(max_length=100)
    barcode = models.CharField(max_length=100)
    nama = models.CharField(max_length=200)
    alias = models.CharField(max_length=200)
    harga1 = models.CharField(max_length=200)
    harga2 = models.CharField(max_length=200)
    harga3 = models.CharField(max_length=200)
    isi_kategori = models.ForeignKey(master_kategori, on_delete=models.SET_NULL, blank=True, null=True)
    satuan = models.ForeignKey(master_unit, on_delete=models.SET_NULL, blank=True, null=True)
    merk = models.ForeignKey(master_merk, on_delete=models.SET_NULL, blank=True, null=True)
    def __str__(self):
        return self.nama

class receiving_detail(models.Model):
    id_rd = models.AutoField(primary_key=True)
    note = models.CharField(max_length=1000)
    qty = models.IntegerField()
    barang = models.ForeignKey(master_kategori, on_delete=models.SET_NULL, blank=True, null=True)
    def __str__(self):
        return  self.id_rd

class receiving_header(models.Model):
    id_rh = models.AutoField(primary_key=True)
    approval = models.IntegerField()
    approval_date = models.DateField()
    counter = models.IntegerField()
    date = models.DateField()
    note = models.CharField(max_length=1000)
    doc_number = models.CharField(max_length=100)
    status = models.CharField(max_length=100)
    lokasi = models.ForeignKey(master_location, on_delete=models.SET_NULL, blank=True, null=True)
    vendor = models.ForeignKey(master_vendor, on_delete=models.SET_NULL, blank=True, null=True)
    def __str__(self):
        return  self.id_rh

class inven_header(models.Model):
    id_ie = models.AutoField(primary_key=True)
    nomor_doc = models.CharField(max_length=100, blank=True, null=True)
    tanggal = models.DateField()
    user = models.CharField(max_length=100)
    lokasi = models.ForeignKey(master_location, on_delete=models.SET_NULL, blank=True, null=True)
    cat_doc = models.CharField(max_length=1000)
    supplier = models.ForeignKey(master_vendor, on_delete=models.SET_NULL, blank=True, null=True)

    def __str__(self):
        return  self.nomor_doc

class inven_detail(models.Model):
    id_id = models.AutoField(primary_key=True)
    barcode = models.CharField(max_length=100, blank=True, null=True)
    kategori = models.ForeignKey(master_kategori, on_delete=models.SET_NULL, blank=True, null=True)
    quantity = models.IntegerField(blank=True, null=True)
    satuan = models.ForeignKey(master_unit, on_delete=models.SET_NULL, blank=True, null=True)
    cat_bar = models.CharField(max_length=1000)
    header = models.ForeignKey(inven_header, on_delete=models.SET_NULL, blank=True, null=True)
    nama_barang = models.ForeignKey(master_barang, on_delete=models.SET_NULL, blank=True, null=True)

    def __str__(self):
        return  self.barcode

class inven_sn(models.Model):
    id_sn = models.AutoField(primary_key=True)
    sn_asli= models.CharField(max_length=100)
    sn_baru= models.CharField(max_length=100)
    detail = models.ForeignKey(inven_detail, on_delete=models.SET_NULL, blank=True, null=True)

    def __str__(self):
        return  self.id_sn