Image.create!([
  {link: "http://blogs-images.forbes.com/sethporges/files/2015/02/apple-watch-6_1.jpg", product_id: 12},
  {link: "http://appdesignvault.s3.amazonaws.com/watch-post/Apple-Watch.psd_-1024x875.png", product_id: 12},
  {link: "http://cdn.macrumors.com/article-new/2014/09/applewatchsizes-800x701.jpg", product_id: 12},
  {link: "http://www.samsung.com/us/explore/galaxy-s7-features-and-specs/dist/assets/img/module1/desktop/intro.jpg", product_id: 7},
  {link: "http://www.androidcentral.com/sites/androidcentral.com/files/styles/larger/public/article_images/2016/03/galaxy-s7-12.jpg?itok=NMbz6foz", product_id: 7},
  {link: "https://dri1.img.digitalrivercontent.net/Storefront/Company/msintl/images/English/en-INTL-Surface-Pro4-SU3-00001/PDP/en-INTL-PDP0-Surface-Pro4-SU3-00001-P1.jpg", product_id: 8},
  {link: "https://tctechcrunch2011.files.wordpress.com/2012/06/gallery_1_large.jpg", product_id: 8},
  {link: "https://timedotcom.files.wordpress.com/2016/03/pr_alexafamily_v01.jpg?quality=75&strip=color&w=1100", product_id: 9},
  {link: "http://www.220-electronics.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/s/a/samsung-ua-32d4003-multi-system-tv.jpg", product_id: 10},
  {link: "http://images.samsung.com/is/image/samsung/pk_UA46ES8000RSOT_027_Front_silver?$TM-Gallery$", product_id: 10},
  {link: "http://www.imore.com/sites/imore.com/files/styles/w800h450crop/public/field/image/2016/03/ipad-mini-ipad-air-ipad-pro-stack-angle-hero.jpg?itok=2bhjFymO", product_id: 11},
  {link: "http://img.bbystatic.com/BestBuy_US/store/ee/2016/tab/pol/pol_EVN-2413_ipad_0724.jpg", product_id: 11},
  {link: "http://www.technobuffalo.com/wp-content/uploads/2015/06/Amazon-Echo-Main-Image.jpg", product_id: 9}
])
Product.create!([
  {name: "Amazon Echo", price: "199.0", description: "Wireless speaker and voice command. Siri, Amazonified", supplier_id: 1},
  {name: "iPad", price: "599.0", description: "In case you need yet another gadget to distract you", supplier_id: 1},
  {name: "Apple Watch", price: "24.0", description: "Awesome watch whose primary function is not to tell the time", supplier_id: 1},
  {name: "Samsung Galaxy s7 Edg", price: "500.0", description: "A smarter than smart phone", supplier_id: 2},
  {name: "Surface", price: "450.0", description: "Microsoft product - hopefully works", supplier_id: 2},
  {name: "Samsung TV", price: "800.0", description: "Awesome TV - complimentary photo given my Snowboarders Anonymous", supplier_id: 2}
])
Supplier.create!([
  {name: "Apple", email: "apple@example.com", phone: "495049586"},
  {name: "Samsung", email: "samsung@example.com", phone: "405938576"}
])
User.create!([
  {name: "Trevor Jones", email: "tjones@example.com", password_digest: "$2a$10$O1kEaVDVCgGBVLPySOnxveiiBDIiZhdKCVKTeO8VmMK6dX/4wNGgu"}
])
