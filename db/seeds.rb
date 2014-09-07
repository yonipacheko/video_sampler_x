# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Video.create!([
                  {title: 41902, start_point: "CG", start_time: "2014-04-24 22:42:00", end_time: "2014-04-25 07:52:00", end_point: "BÄ"},
                  {title: 41904, start_point: "BÄ", start_time: "2014-04-25 07:52:00", end_time: "2014-04-25 22:35:00", end_point: "BJF"},
                  {title: 41903, start_point: "BJF", start_time: "2014-04-24 02:16:00", end_time: "2014-04-24 17:51:00", end_point: "LS"},
                  {title: 41905, start_point: "BJF", start_time: "2014-04-24 02:16:00", end_time: "2014-04-24 16:15:00", end_point: "BÄ"},
                  {title: 41907, start_point: "BÄ", start_time: "2014-04-24 16:15:00", end_time: "2014-04-24 17:51:00", end_point: "LS"},
                  {title: 41914, start_point: "CG", start_time: "2014-04-24 20:46:00", end_time: "2014-04-25 05:34:00", end_point: "BÄ"},
                  {title: 41916, start_point: "BÄ", start_time: "2014-04-25 05:34:00", end_time: "2014-04-25 22:25:00", end_point: "BJF"},
                  {title: 41919, start_point: "BJF", start_time: "2014-04-24 02:45:00", end_time: "2014-04-24 19:33:00", end_point: "ÅGY"},
                  {title: 41943, start_point: "ÅGY", start_time: "2014-04-24 19:33:00", end_time: "2014-04-25 00:38:00", end_point: "KBÄ"},
                  {title: 41920, start_point: "KBÄ", start_time: "2014-04-25 00:38:00", end_time: "2014-04-25 01:00:00", end_point: "JBK"},
                  {title: 41927, start_point: "JBK", start_time: "2014-04-25 01:00:00", end_time: "2014-04-25 04:41:00", end_point: "CG"},
                  {title: 41964, start_point: "BÄ", start_time: "2014-04-24 05:34:00", end_time: "2014-04-24 14:38:00", end_point: "BDN"},
                  {title: 41966, start_point: "BDN", start_time: "2014-04-24 14:46:00", end_time: "2014-04-24 22:25:00", end_point: "BJF"},
                  {title: 41979, start_point: "BDN", start_time: "2014-04-24 10:43:00", end_time: "2014-04-24 19:33:00", end_point: "ÅGY"},
                  {title: 41982, start_point: "CG", start_time: "2014-04-24 00:41:00", end_time: "2014-04-24 03:21:00", end_point: "LÅ"},
                  {title: 41983, start_point: "LÅ", start_time: "2014-04-24 03:21:00", end_time: "2014-04-24 05:50:00", end_point: "JÖGB"},
                  {title: 41984, start_point: "JÖGB", start_time: "2014-04-24 06:30:00", end_time: "2014-04-24 06:38:00", end_point: "JÖ"},
                  {title: 41985, start_point: "JÖ", start_time: "2014-04-24 07:21:00", end_time: "2014-04-24 09:28:00", end_point: "ÄH"},
                  {title: 41986, start_point: "ÄH", start_time: "2014-04-24 15:17:00", end_time: "2014-04-24 17:35:00", end_point: "JÖ"},
                  {title: 41987, start_point: "JÖ", start_time: "2014-04-24 18:07:00", end_time: "2014-04-24 18:15:00", end_point: "JÖGB"},
                  {title: 41988, start_point: "JÖGB", start_time: "2014-04-24 19:13:00", end_time: "2014-04-24 21:44:00", end_point: "LÅ"},
                  {title: 41989, start_point: "LÅ", start_time: "2014-04-24 21:44:00", end_time: "2014-04-25 00:34:00", end_point: "CG"},
                  {title: 42021, start_point: "N", start_time: "2014-04-24 15:40:00", end_time: "2014-04-24 19:17:00", end_point: "HBGB"},
                  {title: 76230, start_point: "LE", start_time: "2014-04-24 18:16:00", end_time: "2014-04-24 18:24:00", end_point: "GST"},
                  {title: 42030, start_point: "GST", start_time: "2014-04-24 18:59:00", end_time: "2014-04-24 19:29:00", end_point: "BDN"},
                  {title: 42031, start_point: "BDN", start_time: "2014-04-24 20:09:00", end_time: "2014-04-25 14:45:00", end_point: "N"},
                  {title: 76256, start_point: "LE", start_time: "2014-04-24 15:37:00", end_time: "2014-04-24 15:44:00", end_point: "GST"},
                  {title: 42056, start_point: "GST", start_time: "2014-04-24 17:09:00", end_time: "2014-04-24 17:30:00", end_point: "BDN"},
                  {title: 42057, start_point: "BDN", start_time: "2014-04-24 18:19:00", end_time: "2014-04-25 09:22:00", end_point: "HPBG"},
                  {title: 42053, start_point: "HPBG", start_time: "2014-04-25 09:25:00", end_time: "2014-04-25 13:29:00", end_point: "GBCO"},
                  {title: 76254, start_point: "GBCO", start_time: "2014-04-25 13:41:00", end_time: "2014-04-25 13:47:00", end_point: "SÄVL"},
                  {title: 42200, start_point: "HBGB", start_time: "2014-04-24 20:06:00", end_time: "2014-04-24 23:10:00", end_point: "N"},
                  {title: 42300, start_point: "N", start_time: "2014-04-24 00:07:00", end_time: "2014-04-24 18:45:00", end_point: "BDN"},
                  {title: 42301, start_point: "BDN", start_time: "2014-04-24 19:53:00", end_time: "2014-04-24 20:22:00", end_point: "GST"},
                  {title: 76291, start_point: "GST", start_time: "2014-04-24 20:58:00", end_time: "2014-04-24 21:05:00", end_point: "LE"},
                  {title: 76203, start_point: "SÄVL", start_time: "2014-04-24 19:53:00", end_time: "2014-04-24 19:58:00", end_point: "GBCO"},
                  {title: 42504, start_point: "GBCO", start_time: "2014-04-24 20:28:00", end_time: "2014-04-25 14:23:00", end_point: "BDN"},
                  {title: 42505, start_point: "BDN", start_time: "2014-04-25 14:59:00", end_time: "2014-04-25 15:21:00", end_point: "GST"},
                  {title: 76295, start_point: "GST", start_time: "2014-04-25 15:51:00", end_time: "2014-04-25 15:57:00", end_point: "LE"},
                  {title: 69783, start_point: "JÖGB", start_time: "2014-04-24 09:04:00", end_time: "2014-04-24 09:28:00", end_point: "MÅP"},
                  {title: 69784, start_point: "MÅP", start_time: "2014-04-24 15:55:00", end_time: "2014-04-24 16:16:00", end_point: "JÖGB"},
                  {title: 69788, start_point: "MÅP", start_time: "2014-04-24 16:49:00", end_time: "2014-04-24 17:10:00", end_point: "JÖGB"}
              ])

Category.create(name: "Day")
Category.create(name: "Night")
Category.create(name: "Afternoon")

Categorization.create(video_id: 1, category_id: 1)
Categorization.create(video_id: 2, category_id: 1)
Categorization.create(video_id: 3, category_id: 1)
Categorization.create(video_id: 4, category_id: 1)
Categorization.create(video_id: 2, category_id: 2)
Categorization.create(video_id: 3, category_id: 2)
Categorization.create(video_id: 4, category_id: 2)
Categorization.create(video_id: 1, category_id: 3)
Categorization.create(video_id: 5, category_id: 1)
Categorization.create(video_id: 6, category_id: 1)
Categorization.create(video_id: 6, category_id: 3)
Categorization.create(video_id: 7, category_id: 1)
Categorization.create(video_id: 8, category_id: 2)
Categorization.create(video_id: 8, category_id: 3)
Categorization.create(video_id: 9, category_id: 3)
Categorization.create(video_id: 10, category_id: 3)
Categorization.create(video_id: 11, category_id: 3)
Categorization.create(video_id: 12, category_id: 3)
Categorization.create(video_id: 13, category_id: 3)
Categorization.create(video_id: 14, category_id: 1)
Categorization.create(video_id: 15, category_id: 1)