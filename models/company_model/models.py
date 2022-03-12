from django.db import models
from django.contrib.auth import get_user_model


# Create your models here.

class CompanyQuerySet(models.QuerySet):
    def delete(self):
        for company in self:
            company.logo_img.delete()
        super(CompanyQuerySet, self).delete()


class Company(models.Model):
    user = models.ForeignKey(get_user_model(), on_delete=models.CASCADE)
    name = models.CharField(max_length=255)
    phone_number = models.CharField(max_length=255)
    address = models.TextField()
    logo_img = models.ImageField(upload_to='company', blank=True)

    created_at = models.DateTimeField(auto_now_add=True)

    objects = CompanyQuerySet()

    class Meta:
        verbose_name = 'Company'
        verbose_name_plural = 'Companies'

    def delete(self, *args, **kwargs):
        if self.logo_img:
            self.logo_img.delete()
        super(Company, self).delete(*args, **kwargs)

    def save(self, *args, **kwargs):
        if self.logo_img:
            self.logo_img.name = 'logo_' + self.name.lower() + '_.' + \
                self.logo_img.name.split('.')[-1]

        super(Company, self).save(*args, **kwargs)

    def __str__(self):
        return self.name
