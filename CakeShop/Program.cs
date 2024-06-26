﻿using CakeShop.Data;
using CakeShop.Helpers;
using CakeShop.Services;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

// Singleton
builder.Services.AddDbContext<CakeshopContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("CakeShop"));
});

// Configure session state
builder.Services.AddDistributedMemoryCache();

builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromSeconds(10);
    options.Cookie.HttpOnly = true;
    options.Cookie.IsEssential = true;
});
// Configure AutoMapper https://docs.automapper.org/en/stable/Dependency-injection.html
builder.Services.AddAutoMapper(typeof(AutoMapperProfile));



// Configure authentication https://learn.microsoft.com/en-us/aspnet/core/security/authentication/?view=aspnetcore-8.0

builder.Services.AddAuthentication(options =>
{
    options.DefaultScheme = "CustomerCookie";
    options.DefaultChallengeScheme = "CustomerCookie";
})
.AddCookie("CustomerCookie", options =>
{
    options.LoginPath = "/KhachHang/DangNhap";
    options.AccessDeniedPath = "/AccessDenied";
})
.AddCookie("AdminCookie", options =>
{
    options.LoginPath = "/Admin/Account/Login";
    options.AccessDeniedPath = "/Admin/Account/AccessDenied";
});



builder.Services.AddSingleton<IVnPayService, VnPayService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseStaticFiles();

app.UseSession();

app.UseRouting();

app.UseAuthentication();

app.UseAuthorization();

/*app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

*/
#pragma warning disable ASP0014 // Suggest using top level route registrations
app.UseEndpoints(endpoints =>
{
    endpoints.MapControllerRoute(
        name: "default",
        pattern: "{controller=Home}/{action=Index}/{id?}");

    endpoints.MapAreaControllerRoute(
        name: "areas",
        areaName: "Admin",
        pattern: "{area:exists}/{controller=Account}/{action=Index}/{id?}");
});

/*name: "admin",
        areaName: "Admin",
        pattern: "Admin/{controller=Account}/{action=Index}/{id?}");
endpoints.MapControllerRoute(
name: "areas",
pattern: "{area:exists}/{controller=Product}/{action=Index}/{id?}");
endpoints.MapControllerRoute(
name: "default",
pattern: "{controller=Product}/{action=Index}/{id?}");*/
#pragma warning restore ASP0014 // Suggest using top level route registrations
app.Run();
