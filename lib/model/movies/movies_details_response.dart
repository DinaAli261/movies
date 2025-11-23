/// status : "ok"
/// status_message : "Query was successful"
/// data : {"movie":{"id":16,"url":"https://yts.lt/movies/17-again-2009","imdb_code":"tt0974661","title":"17 Again","title_english":"17 Again","title_long":"17 Again (2009)","slug":"17-again-2009","year":2009,"rating":6.4,"runtime":102,"genres":["Action","Comedy","Drama","Family","Fantasy","Romance","Sport"],"like_count":155,"description_intro":"37 year old Mike O'Donnell is extremely disappointed with his life because of some of the choices he made when he was 17. His wife threw him out of the house his kids think that he's a loser and want nothing to do with him, he lost his job. One small action gave him a another shot at his senior year in high school. For his kids he goes from a loser of a dad to an amazing friend that gives them great advice. He also realizes the things that he didn't realize when he was actually 17. Seeing senior year from a different point of view makes him realize that doing your life over isn't as fun as it seems.","description_full":"37 year old Mike O'Donnell is extremely disappointed with his life because of some of the choices he made when he was 17. His wife threw him out of the house his kids think that he's a loser and want nothing to do with him, he lost his job. One small action gave him a another shot at his senior year in high school. For his kids he goes from a loser of a dad to an amazing friend that gives them great advice. He also realizes the things that he didn't realize when he was actually 17. Seeing senior year from a different point of view makes him realize that doing your life over isn't as fun as it seems.","yt_trailer_code":"2wn6pAIRjjY","language":"en","mpa_rating":"","background_image":"https://yts.lt/assets/images/movies/17_Again_2009/background.jpg","background_image_original":"https://yts.lt/assets/images/movies/17_Again_2009/background.jpg","small_cover_image":"https://yts.lt/assets/images/movies/17_Again_2009/small-cover.jpg","medium_cover_image":"https://yts.lt/assets/images/movies/17_Again_2009/medium-cover.jpg","large_cover_image":"https://yts.lt/assets/images/movies/17_Again_2009/large-cover.jpg","medium_screenshot_image1":"https://yts.lt/assets/images/movies/17_Again_2009/medium-screenshot1.jpg","medium_screenshot_image2":"https://yts.lt/assets/images/movies/17_Again_2009/medium-screenshot2.jpg","medium_screenshot_image3":"https://yts.lt/assets/images/movies/17_Again_2009/medium-screenshot3.jpg","large_screenshot_image1":"https://yts.lt/assets/images/movies/17_Again_2009/large-screenshot1.jpg","large_screenshot_image2":"https://yts.lt/assets/images/movies/17_Again_2009/large-screenshot2.jpg","large_screenshot_image3":"https://yts.lt/assets/images/movies/17_Again_2009/large-screenshot3.jpg","cast":[{"name":"Zac Efron","character_name":"Mike O'Donnell","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm1374980.jpg","imdb_code":"1374980"},{"name":"Margaret Cho","character_name":"Mrs. Dell","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm0158632.jpg","imdb_code":"0158632"},{"name":"Leslie Mann","character_name":"Scarlet","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm0005182.jpg","imdb_code":"0005182"},{"name":"Jesse Heiman","character_name":"Mascot","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm1035503.jpg","imdb_code":"1035503"}],"torrents":[{"url":"https://yts.lt/torrent/download/3E3BD4ACCC26ADCE84E30A4147F15E23C0FC83AC","hash":"3E3BD4ACCC26ADCE84E30A4147F15E23C0FC83AC","quality":"720p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":33,"peers":3,"size":"650.58 MB","size_bytes":682182574,"date_uploaded":"2015-10-31 20:47:43","date_uploaded_unix":1446320863},{"url":"https://yts.lt/torrent/download/8CEFCE5C1B727A41147D72A4DAC2D1058A88034B","hash":"8CEFCE5C1B727A41147D72A4DAC2D1058A88034B","quality":"1080p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":92,"peers":21,"size":"1.50 GB","size_bytes":1610612736,"date_uploaded":"2015-10-31 20:47:45","date_uploaded_unix":1446320865}],"date_uploaded":"2015-10-31 20:47:43","date_uploaded_unix":1446320863}}
/// @meta : {"server_time":1763909483,"server_timezone":"CET","api_version":2,"execution_time":"0 ms"}

class MoviesDetails {
  MoviesDetails({
    this.status,
    this.statusMessage,
    this.data,
    // this.meta,
  });

  MoviesDetails.fromJson(dynamic json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    // meta = json['@meta'] != null ? @meta.fromJson(json['@meta']) : null;
  }
  String? status;
  String? statusMessage;
  Data? data;
  // @meta? meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['status_message'] = statusMessage;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    // if (meta != null) {
    //   map['@meta'] = meta?.toJson();
    // }
    return map;
  }

}

/// server_time : 1763909483
/// server_timezone : "CET"
/// api_version : 2
/// execution_time : "0 ms"

// class @meta {
//   @meta({
//       this.serverTime,
//       this.serverTimezone,
//       this.apiVersion,
//       this.executionTime,});

// @meta.fromJson(dynamic json) {
//   serverTime = json['server_time'];
//   serverTimezone = json['server_timezone'];
//   apiVersion = json['api_version'];
//   executionTime = json['execution_time'];
// }
int? serverTime;
String? serverTimezone;
int? apiVersion;
String? executionTime;

Map<String, dynamic> toJson() {
  final map = <String, dynamic>{};
  map['server_time'] = serverTime;
  map['server_timezone'] = serverTimezone;
  map['api_version'] = apiVersion;
  map['execution_time'] = executionTime;
  return map;
}



/// movie : {"id":16,"url":"https://yts.lt/movies/17-again-2009","imdb_code":"tt0974661","title":"17 Again","title_english":"17 Again","title_long":"17 Again (2009)","slug":"17-again-2009","year":2009,"rating":6.4,"runtime":102,"genres":["Action","Comedy","Drama","Family","Fantasy","Romance","Sport"],"like_count":155,"description_intro":"37 year old Mike O'Donnell is extremely disappointed with his life because of some of the choices he made when he was 17. His wife threw him out of the house his kids think that he's a loser and want nothing to do with him, he lost his job. One small action gave him a another shot at his senior year in high school. For his kids he goes from a loser of a dad to an amazing friend that gives them great advice. He also realizes the things that he didn't realize when he was actually 17. Seeing senior year from a different point of view makes him realize that doing your life over isn't as fun as it seems.","description_full":"37 year old Mike O'Donnell is extremely disappointed with his life because of some of the choices he made when he was 17. His wife threw him out of the house his kids think that he's a loser and want nothing to do with him, he lost his job. One small action gave him a another shot at his senior year in high school. For his kids he goes from a loser of a dad to an amazing friend that gives them great advice. He also realizes the things that he didn't realize when he was actually 17. Seeing senior year from a different point of view makes him realize that doing your life over isn't as fun as it seems.","yt_trailer_code":"2wn6pAIRjjY","language":"en","mpa_rating":"","background_image":"https://yts.lt/assets/images/movies/17_Again_2009/background.jpg","background_image_original":"https://yts.lt/assets/images/movies/17_Again_2009/background.jpg","small_cover_image":"https://yts.lt/assets/images/movies/17_Again_2009/small-cover.jpg","medium_cover_image":"https://yts.lt/assets/images/movies/17_Again_2009/medium-cover.jpg","large_cover_image":"https://yts.lt/assets/images/movies/17_Again_2009/large-cover.jpg","medium_screenshot_image1":"https://yts.lt/assets/images/movies/17_Again_2009/medium-screenshot1.jpg","medium_screenshot_image2":"https://yts.lt/assets/images/movies/17_Again_2009/medium-screenshot2.jpg","medium_screenshot_image3":"https://yts.lt/assets/images/movies/17_Again_2009/medium-screenshot3.jpg","large_screenshot_image1":"https://yts.lt/assets/images/movies/17_Again_2009/large-screenshot1.jpg","large_screenshot_image2":"https://yts.lt/assets/images/movies/17_Again_2009/large-screenshot2.jpg","large_screenshot_image3":"https://yts.lt/assets/images/movies/17_Again_2009/large-screenshot3.jpg","cast":[{"name":"Zac Efron","character_name":"Mike O'Donnell","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm1374980.jpg","imdb_code":"1374980"},{"name":"Margaret Cho","character_name":"Mrs. Dell","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm0158632.jpg","imdb_code":"0158632"},{"name":"Leslie Mann","character_name":"Scarlet","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm0005182.jpg","imdb_code":"0005182"},{"name":"Jesse Heiman","character_name":"Mascot","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm1035503.jpg","imdb_code":"1035503"}],"torrents":[{"url":"https://yts.lt/torrent/download/3E3BD4ACCC26ADCE84E30A4147F15E23C0FC83AC","hash":"3E3BD4ACCC26ADCE84E30A4147F15E23C0FC83AC","quality":"720p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":33,"peers":3,"size":"650.58 MB","size_bytes":682182574,"date_uploaded":"2015-10-31 20:47:43","date_uploaded_unix":1446320863},{"url":"https://yts.lt/torrent/download/8CEFCE5C1B727A41147D72A4DAC2D1058A88034B","hash":"8CEFCE5C1B727A41147D72A4DAC2D1058A88034B","quality":"1080p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":92,"peers":21,"size":"1.50 GB","size_bytes":1610612736,"date_uploaded":"2015-10-31 20:47:45","date_uploaded_unix":1446320865}],"date_uploaded":"2015-10-31 20:47:43","date_uploaded_unix":1446320863}

class Data {
  Data({
    this.movie,});

  Data.fromJson(dynamic json) {
    movie = json['movie'] != null ? Movie.fromJson(json['movie']) : null;
  }
  Movie? movie;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (movie != null) {
      map['movie'] = movie?.toJson();
    }
    return map;
  }

}

/// id : 16
/// url : "https://yts.lt/movies/17-again-2009"
/// imdb_code : "tt0974661"
/// title : "17 Again"
/// title_english : "17 Again"
/// title_long : "17 Again (2009)"
/// slug : "17-again-2009"
/// year : 2009
/// rating : 6.4
/// runtime : 102
/// genres : ["Action","Comedy","Drama","Family","Fantasy","Romance","Sport"]
/// like_count : 155
/// description_intro : "37 year old Mike O'Donnell is extremely disappointed with his life because of some of the choices he made when he was 17. His wife threw him out of the house his kids think that he's a loser and want nothing to do with him, he lost his job. One small action gave him a another shot at his senior year in high school. For his kids he goes from a loser of a dad to an amazing friend that gives them great advice. He also realizes the things that he didn't realize when he was actually 17. Seeing senior year from a different point of view makes him realize that doing your life over isn't as fun as it seems."
/// description_full : "37 year old Mike O'Donnell is extremely disappointed with his life because of some of the choices he made when he was 17. His wife threw him out of the house his kids think that he's a loser and want nothing to do with him, he lost his job. One small action gave him a another shot at his senior year in high school. For his kids he goes from a loser of a dad to an amazing friend that gives them great advice. He also realizes the things that he didn't realize when he was actually 17. Seeing senior year from a different point of view makes him realize that doing your life over isn't as fun as it seems."
/// yt_trailer_code : "2wn6pAIRjjY"
/// language : "en"
/// mpa_rating : ""
/// background_image : "https://yts.lt/assets/images/movies/17_Again_2009/background.jpg"
/// background_image_original : "https://yts.lt/assets/images/movies/17_Again_2009/background.jpg"
/// small_cover_image : "https://yts.lt/assets/images/movies/17_Again_2009/small-cover.jpg"
/// medium_cover_image : "https://yts.lt/assets/images/movies/17_Again_2009/medium-cover.jpg"
/// large_cover_image : "https://yts.lt/assets/images/movies/17_Again_2009/large-cover.jpg"
/// medium_screenshot_image1 : "https://yts.lt/assets/images/movies/17_Again_2009/medium-screenshot1.jpg"
/// medium_screenshot_image2 : "https://yts.lt/assets/images/movies/17_Again_2009/medium-screenshot2.jpg"
/// medium_screenshot_image3 : "https://yts.lt/assets/images/movies/17_Again_2009/medium-screenshot3.jpg"
/// large_screenshot_image1 : "https://yts.lt/assets/images/movies/17_Again_2009/large-screenshot1.jpg"
/// large_screenshot_image2 : "https://yts.lt/assets/images/movies/17_Again_2009/large-screenshot2.jpg"
/// large_screenshot_image3 : "https://yts.lt/assets/images/movies/17_Again_2009/large-screenshot3.jpg"
/// cast : [{"name":"Zac Efron","character_name":"Mike O'Donnell","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm1374980.jpg","imdb_code":"1374980"},{"name":"Margaret Cho","character_name":"Mrs. Dell","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm0158632.jpg","imdb_code":"0158632"},{"name":"Leslie Mann","character_name":"Scarlet","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm0005182.jpg","imdb_code":"0005182"},{"name":"Jesse Heiman","character_name":"Mascot","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm1035503.jpg","imdb_code":"1035503"}]
/// torrents : [{"url":"https://yts.lt/torrent/download/3E3BD4ACCC26ADCE84E30A4147F15E23C0FC83AC","hash":"3E3BD4ACCC26ADCE84E30A4147F15E23C0FC83AC","quality":"720p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":33,"peers":3,"size":"650.58 MB","size_bytes":682182574,"date_uploaded":"2015-10-31 20:47:43","date_uploaded_unix":1446320863},{"url":"https://yts.lt/torrent/download/8CEFCE5C1B727A41147D72A4DAC2D1058A88034B","hash":"8CEFCE5C1B727A41147D72A4DAC2D1058A88034B","quality":"1080p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":92,"peers":21,"size":"1.50 GB","size_bytes":1610612736,"date_uploaded":"2015-10-31 20:47:45","date_uploaded_unix":1446320865}]
/// date_uploaded : "2015-10-31 20:47:43"
/// date_uploaded_unix : 1446320863

class Movie {
  Movie({
    this.id,
    this.url,
    this.imdbCode,
    this.title,
    this.titleEnglish,
    this.titleLong,
    this.slug,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.likeCount,
    this.descriptionIntro,
    this.descriptionFull,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.mediumScreenshotImage1,
    this.mediumScreenshotImage2,
    this.mediumScreenshotImage3,
    this.largeScreenshotImage1,
    this.largeScreenshotImage2,
    this.largeScreenshotImage3,
    this.cast,
    this.torrents,
    this.dateUploaded,
    this.dateUploadedUnix,});

  Movie.fromJson(dynamic json) {
    id = json['id'];
    url = json['url'];
    imdbCode = json['imdb_code'];
    title = json['title'];
    titleEnglish = json['title_english'];
    titleLong = json['title_long'];
    slug = json['slug'];
    year = json['year'];
    rating = json['rating'];
    runtime = json['runtime'];
    genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    likeCount = json['like_count'];
    descriptionIntro = json['description_intro'];
    descriptionFull = json['description_full'];
    ytTrailerCode = json['yt_trailer_code'];
    language = json['language'];
    mpaRating = json['mpa_rating'];
    backgroundImage = json['background_image'];
    backgroundImageOriginal = json['background_image_original'];
    smallCoverImage = json['small_cover_image'];
    mediumCoverImage = json['medium_cover_image'];
    largeCoverImage = json['large_cover_image'];
    mediumScreenshotImage1 = json['medium_screenshot_image1'];
    mediumScreenshotImage2 = json['medium_screenshot_image2'];
    mediumScreenshotImage3 = json['medium_screenshot_image3'];
    largeScreenshotImage1 = json['large_screenshot_image1'];
    largeScreenshotImage2 = json['large_screenshot_image2'];
    largeScreenshotImage3 = json['large_screenshot_image3'];
    if (json['cast'] != null) {
      cast = [];
      json['cast'].forEach((v) {
        cast?.add(Cast.fromJson(v));
      });
    }
    if (json['torrents'] != null) {
      torrents = [];
      json['torrents'].forEach((v) {
        torrents?.add(Torrents.fromJson(v));
      });
    }
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }
  int? id;
  String? url;
  String? imdbCode;
  String? title;
  String? titleEnglish;
  String? titleLong;
  String? slug;
  int? year;
  double? rating;
  int? runtime;
  List<String>? genres;
  int? likeCount;
  String? descriptionIntro;
  String? descriptionFull;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;
  String? mediumScreenshotImage1;
  String? mediumScreenshotImage2;
  String? mediumScreenshotImage3;
  String? largeScreenshotImage1;
  String? largeScreenshotImage2;
  String? largeScreenshotImage3;
  List<Cast>? cast;
  List<Torrents>? torrents;
  String? dateUploaded;
  int? dateUploadedUnix;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    map['imdb_code'] = imdbCode;
    map['title'] = title;
    map['title_english'] = titleEnglish;
    map['title_long'] = titleLong;
    map['slug'] = slug;
    map['year'] = year;
    map['rating'] = rating;
    map['runtime'] = runtime;
    map['genres'] = genres;
    map['like_count'] = likeCount;
    map['description_intro'] = descriptionIntro;
    map['description_full'] = descriptionFull;
    map['yt_trailer_code'] = ytTrailerCode;
    map['language'] = language;
    map['mpa_rating'] = mpaRating;
    map['background_image'] = backgroundImage;
    map['background_image_original'] = backgroundImageOriginal;
    map['small_cover_image'] = smallCoverImage;
    map['medium_cover_image'] = mediumCoverImage;
    map['large_cover_image'] = largeCoverImage;
    map['medium_screenshot_image1'] = mediumScreenshotImage1;
    map['medium_screenshot_image2'] = mediumScreenshotImage2;
    map['medium_screenshot_image3'] = mediumScreenshotImage3;
    map['large_screenshot_image1'] = largeScreenshotImage1;
    map['large_screenshot_image2'] = largeScreenshotImage2;
    map['large_screenshot_image3'] = largeScreenshotImage3;
    if (cast != null) {
      map['cast'] = cast?.map((v) => v.toJson()).toList();
    }
    if (torrents != null) {
      map['torrents'] = torrents?.map((v) => v.toJson()).toList();
    }
    map['date_uploaded'] = dateUploaded;
    map['date_uploaded_unix'] = dateUploadedUnix;
    return map;
  }

}

/// url : "https://yts.lt/torrent/download/3E3BD4ACCC26ADCE84E30A4147F15E23C0FC83AC"
/// hash : "3E3BD4ACCC26ADCE84E30A4147F15E23C0FC83AC"
/// quality : "720p"
/// type : "bluray"
/// is_repack : "0"
/// video_codec : "x264"
/// bit_depth : "8"
/// audio_channels : "2.0"
/// seeds : 33
/// peers : 3
/// size : "650.58 MB"
/// size_bytes : 682182574
/// date_uploaded : "2015-10-31 20:47:43"
/// date_uploaded_unix : 1446320863

class Torrents {
  Torrents({
    this.url,
    this.hash,
    this.quality,
    this.type,
    this.isRepack,
    this.videoCodec,
    this.bitDepth,
    this.audioChannels,
    this.seeds,
    this.peers,
    this.size,
    this.sizeBytes,
    this.dateUploaded,
    this.dateUploadedUnix,});

  Torrents.fromJson(dynamic json) {
    url = json['url'];
    hash = json['hash'];
    quality = json['quality'];
    type = json['type'];
    isRepack = json['is_repack'];
    videoCodec = json['video_codec'];
    bitDepth = json['bit_depth'];
    audioChannels = json['audio_channels'];
    seeds = json['seeds'];
    peers = json['peers'];
    size = json['size'];
    sizeBytes = json['size_bytes'];
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }
  String? url;
  String? hash;
  String? quality;
  String? type;
  String? isRepack;
  String? videoCodec;
  String? bitDepth;
  String? audioChannels;
  int? seeds;
  int? peers;
  String? size;
  int? sizeBytes;
  String? dateUploaded;
  int? dateUploadedUnix;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['hash'] = hash;
    map['quality'] = quality;
    map['type'] = type;
    map['is_repack'] = isRepack;
    map['video_codec'] = videoCodec;
    map['bit_depth'] = bitDepth;
    map['audio_channels'] = audioChannels;
    map['seeds'] = seeds;
    map['peers'] = peers;
    map['size'] = size;
    map['size_bytes'] = sizeBytes;
    map['date_uploaded'] = dateUploaded;
    map['date_uploaded_unix'] = dateUploadedUnix;
    return map;
  }

}

/// name : "Zac Efron"
/// character_name : "Mike O'Donnell"
/// url_small_image : "https://yts.lt/assets/images/actors/thumb/nm1374980.jpg"
/// imdb_code : "1374980"

class Cast {
  Cast({
    this.name,
    this.characterName,
    this.urlSmallImage,
    this.imdbCode,});

  Cast.fromJson(dynamic json) {
    name = json['name'];
    characterName = json['character_name'];
    urlSmallImage = json['url_small_image'];
    imdbCode = json['imdb_code'];
  }
  String? name;
  String? characterName;
  String? urlSmallImage;
  String? imdbCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['character_name'] = characterName;
    map['url_small_image'] = urlSmallImage;
    map['imdb_code'] = imdbCode;
    return map;
  }

}