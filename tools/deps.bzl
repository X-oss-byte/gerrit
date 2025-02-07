load("//tools/bzl:maven_jar.bzl", "GERRIT", "maven_jar")

CAFFEINE_VERS = "2.9.2"
ANTLR_VERS = "3.5.2"
COMMONMARK_VERSION = "0.21.0"
FLEXMARK_VERS = "0.64.0"
GREENMAIL_VERS = "1.5.5"
MAIL_VERS = "1.6.0"
MIME4J_VERS = "0.8.1"
OW2_VERS = "9.2"
AUTO_COMMON_VERSION = "1.2.1"
AUTO_FACTORY_VERSION = "1.0.1"
AUTO_VALUE_VERSION = "1.7.4"
AUTO_VALUE_GSON_VERSION = "1.3.1"
PROLOG_VERS = "1.4.4"
PROLOG_REPO = GERRIT
GITILES_VERS = "1.1.0"
GITILES_REPO = GERRIT

# When updating Bouncy Castle, also update it in bazlets.
BC_VERS = "1.72"
HTTPCOMP_VERS = "4.5.2"
JETTY_VERS = "9.4.51.v20230217"
BYTE_BUDDY_VERSION = "1.10.7"
ROARING_BITMAP_VERSION = "0.9.44"

def java_dependencies():
    maven_jar(
        name = "java-runtime",
        artifact = "org.antlr:antlr-runtime:" + ANTLR_VERS,
        sha1 = "cd9cd41361c155f3af0f653009dcecb08d8b4afd",
    )

    maven_jar(
        name = "stringtemplate",
        artifact = "org.antlr:stringtemplate:4.0.2",
        sha1 = "e28e09e2d44d60506a7bcb004d6c23ff35c6ac08",
    )

    maven_jar(
        name = "org-antlr",
        artifact = "org.antlr:antlr:" + ANTLR_VERS,
        sha1 = "c4a65c950bfc3e7d04309c515b2177c00baf7764",
    )

    maven_jar(
        name = "antlr27",
        artifact = "antlr:antlr:2.7.7",
        attach_source = False,
        sha1 = "83cd2cd674a217ade95a4bb83a8a14f351f48bd0",
    )

    maven_jar(
        name = "aopalliance",
        artifact = "aopalliance:aopalliance:1.0",
        sha1 = "0235ba8b489512805ac13a8f9ea77a1ca5ebe3e8",
    )

    maven_jar(
        name = "javax_inject",
        artifact = "javax.inject:javax.inject:1",
        sha1 = "6975da39a7040257bd51d21a231b76c915872d38",
    )

    maven_jar(
        name = "servlet-api",
        artifact = "javax.servlet:javax.servlet-api:3.1.0",
        sha1 = "3cd63d075497751784b2fa84be59432f4905bf7c",
    )

    # JGit's transitive dependencies

    maven_jar(
        name = "javaewah",
        artifact = "com.googlecode.javaewah:JavaEWAH:1.1.12",
        attach_source = False,
        sha1 = "9feecc2b24d6bc9ff865af8d082f192238a293eb",
    )

    maven_jar(
        name = "gson",
        artifact = "com.google.code.gson:gson:2.9.0",
        sha1 = "8a1167e089096758b49f9b34066ef98b2f4b37aa",
    )

    maven_jar(
        name = "caffeine",
        artifact = "com.github.ben-manes.caffeine:caffeine:" + CAFFEINE_VERS,
        sha1 = "0a17ed335e0ce2d337750772c0709b79af35a842",
    )

    maven_jar(
        name = "guava-failureaccess",
        artifact = "com.google.guava:failureaccess:1.0.1",
        sha1 = "1dcf1de382a0bf95a3d8b0849546c88bac1292c9",
    )

    maven_jar(
        name = "juniversalchardet",
        artifact = "com.github.albfernandez:juniversalchardet:2.0.0",
        sha1 = "28c59f58f5adcc307604602e2aa89e2aca14c554",
    )

    maven_jar(
        name = "json-smart",
        artifact = "net.minidev:json-smart:1.1.1",
        sha1 = "24a2f903d25e004de30ac602c5b47f2d4e420a59",
    )

    maven_jar(
        name = "args4j",
        artifact = "args4j:args4j:2.33",
        sha1 = "bd87a75374a6d6523de82fef51fc3cfe9baf9fc9",
    )

    maven_jar(
        name = "commons-codec",
        artifact = "commons-codec:commons-codec:1.15",
        sha1 = "49d94806b6e3dc933dacbd8acb0fdbab8ebd1e5d",
    )

    # When upgrading commons-compress, also upgrade tukaani-xz
    maven_jar(
        name = "commons-compress",
        artifact = "org.apache.commons:commons-compress:1.22",
        sha1 = "691a8b4e6cf4248c3bc72c8b719337d5cb7359fa",
    )

    maven_jar(
        name = "commons-lang3",
        artifact = "org.apache.commons:commons-lang3:3.8.1",
        sha1 = "6505a72a097d9270f7a9e7bf42c4238283247755",
    )

    maven_jar(
        name = "commons-text",
        artifact = "org.apache.commons:commons-text:1.2",
        sha1 = "74acdec7237f576c4803fff0c1008ab8a3808b2b",
    )

    maven_jar(
        name = "commons-dbcp",
        artifact = "commons-dbcp:commons-dbcp:1.4",
        sha1 = "30be73c965cc990b153a100aaaaafcf239f82d39",
    )

    # Transitive dependency of commons-dbcp, do not update without
    # also updating commons-dbcp
    maven_jar(
        name = "commons-pool",
        artifact = "commons-pool:commons-pool:1.5.5",
        sha1 = "7d8ffbdc47aa0c5a8afe5dc2aaf512f369f1d19b",
    )

    maven_jar(
        name = "commons-net",
        artifact = "commons-net:commons-net:3.6",
        sha1 = "b71de00508dcb078d2b24b5fa7e538636de9b3da",
    )

    maven_jar(
        name = "commons-validator",
        artifact = "commons-validator:commons-validator:1.6",
        sha1 = "e989d1e87cdd60575df0765ed5bac65c905d7908",
    )

    maven_jar(
        name = "automaton",
        artifact = "dk.brics:automaton:1.12-1",
        sha1 = "959a0c62f9a5c2309e0ad0b0589c74d69e101241",
    )

    # commonmark must match the version used in Gitiles
    maven_jar(
        name = "commonmark",
        artifact = "org.commonmark:commonmark:" + COMMONMARK_VERSION,
        sha1 = "c98f0473b17c87fe4fa2fc62a7c6523a2fe018f0",
    )

    maven_jar(
        name = "cm-autolink",
        artifact = "org.commonmark:commonmark-ext-autolink:" + COMMONMARK_VERSION,
        sha1 = "55c0312cf443fa3d5af0daeeeca00d6deee3cf90",
    )

    maven_jar(
        name = "gfm-strikethrough",
        artifact = "org.commonmark:commonmark-ext-gfm-strikethrough:" + COMMONMARK_VERSION,
        sha1 = "953f4b71e133a98fcca93f3c3f4e58b895b76d1f",
    )

    maven_jar(
        name = "gfm-tables",
        artifact = "org.commonmark:commonmark-ext-gfm-tables:" + COMMONMARK_VERSION,
        attach_source = False,
        sha1 = "fb7d65fa89a4cfcd2f51535d2549b570cf1dbd1a",
    )

    maven_jar(
        name = "flexmark",
        artifact = "com.vladsch.flexmark:flexmark:" + FLEXMARK_VERS,
        sha1 = "bb5fcdf1335a35c4c0285fee2683a32e6a70cd59",
    )

    maven_jar(
        name = "flexmark-ext-abbreviation",
        artifact = "com.vladsch.flexmark:flexmark-ext-abbreviation:" + FLEXMARK_VERS,
        sha1 = "48a64d5d1e5d1e0f8efde75f051b16800952eeb3",
    )

    maven_jar(
        name = "flexmark-ext-anchorlink",
        artifact = "com.vladsch.flexmark:flexmark-ext-anchorlink:" + FLEXMARK_VERS,
        sha1 = "e263a138896153bad6b69828d65c409fd99292a8",
    )

    maven_jar(
        name = "flexmark-ext-autolink",
        artifact = "com.vladsch.flexmark:flexmark-ext-autolink:" + FLEXMARK_VERS,
        sha1 = "e380ee48d5a779d08f071aaaf9a69e5985f24802",
    )

    maven_jar(
        name = "flexmark-ext-definition",
        artifact = "com.vladsch.flexmark:flexmark-ext-definition:" + FLEXMARK_VERS,
        sha1 = "892d83daafb1255489377a4331c6b04cd9fef288",
    )

    maven_jar(
        name = "flexmark-ext-emoji",
        artifact = "com.vladsch.flexmark:flexmark-ext-emoji:" + FLEXMARK_VERS,
        sha1 = "63777b6b82456fb08587537db949c67ac6ac5d66",
    )

    maven_jar(
        name = "flexmark-ext-escaped-character",
        artifact = "com.vladsch.flexmark:flexmark-ext-escaped-character:" + FLEXMARK_VERS,
        sha1 = "19b48848dd0d242c8dd527113cf91711847cf7f1",
    )

    maven_jar(
        name = "flexmark-ext-footnotes",
        artifact = "com.vladsch.flexmark:flexmark-ext-footnotes:" + FLEXMARK_VERS,
        sha1 = "a885e4c512f6f73b3ea02a26f71e0116e720b33e",
    )

    maven_jar(
        name = "flexmark-ext-gfm-issues",
        artifact = "com.vladsch.flexmark:flexmark-ext-gfm-issues:" + FLEXMARK_VERS,
        sha1 = "f1f2e840cd295bfaad006e7bddb715edfd747e44",
    )

    maven_jar(
        name = "flexmark-ext-gfm-strikethrough",
        artifact = "com.vladsch.flexmark:flexmark-ext-gfm-strikethrough:" + FLEXMARK_VERS,
        sha1 = "9e4d01143752ebe98d45ac29c77e17fa8cc8b947",
    )

    maven_jar(
        name = "flexmark-ext-gfm-tasklist",
        artifact = "com.vladsch.flexmark:flexmark-ext-gfm-tasklist:" + FLEXMARK_VERS,
        sha1 = "ad5d3dda8a17100ee01606386aacb73d41e35764",
    )

    maven_jar(
        name = "flexmark-ext-gfm-users",
        artifact = "com.vladsch.flexmark:flexmark-ext-gfm-users:" + FLEXMARK_VERS,
        sha1 = "59846560518f6ef5282d333e1ba1a68dc5ea8c43",
    )

    maven_jar(
        name = "flexmark-ext-ins",
        artifact = "com.vladsch.flexmark:flexmark-ext-ins:" + FLEXMARK_VERS,
        sha1 = "b5a7e72e337d31e2956f662b37ec1f47289e7751",
    )

    maven_jar(
        name = "flexmark-ext-jekyll-front-matter",
        artifact = "com.vladsch.flexmark:flexmark-ext-jekyll-front-matter:" + FLEXMARK_VERS,
        sha1 = "5543c826f325444edacc6920992753568aa046f6",
    )

    maven_jar(
        name = "flexmark-ext-superscript",
        artifact = "com.vladsch.flexmark:flexmark-ext-superscript:" + FLEXMARK_VERS,
        sha1 = "bcee70d603fb7acf9ef490036b14a5c1cb3f533c",
    )

    maven_jar(
        name = "flexmark-ext-tables",
        artifact = "com.vladsch.flexmark:flexmark-ext-tables:" + FLEXMARK_VERS,
        sha1 = "52b829753bb928cd3f26c43d39639eb95b3f9f88",
    )

    maven_jar(
        name = "flexmark-ext-toc",
        artifact = "com.vladsch.flexmark:flexmark-ext-toc:" + FLEXMARK_VERS,
        sha1 = "69b96da85758688a564babea371fc9268a11d718",
    )

    maven_jar(
        name = "flexmark-ext-typographic",
        artifact = "com.vladsch.flexmark:flexmark-ext-typographic:" + FLEXMARK_VERS,
        sha1 = "5e2cb29da6c43eecffbd34a4f69976f61a383e97",
    )

    maven_jar(
        name = "flexmark-ext-wikilink",
        artifact = "com.vladsch.flexmark:flexmark-ext-wikilink:" + FLEXMARK_VERS,
        sha1 = "5ada81fecf0d68cdcd5c763da0f5f22aa885d559",
    )

    maven_jar(
        name = "flexmark-ext-yaml-front-matter",
        artifact = "com.vladsch.flexmark:flexmark-ext-yaml-front-matter:" + FLEXMARK_VERS,
        sha1 = "377b29278cad7603aa3ca705c31a9f48cb6f8fb9",
    )

    maven_jar(
        name = "flexmark-profile-pegdown",
        artifact = "com.vladsch.flexmark:flexmark-profile-pegdown:" + FLEXMARK_VERS,
        sha1 = "c67446ffd3653416ed26f924ba99f8125fb74791",
    )

    maven_jar(
        name = "flexmark-util-data",
        artifact = "com.vladsch.flexmark:flexmark-util-data:" + FLEXMARK_VERS,
        attach_source = False,
        sha1 = "63162607faa7c98f6e50a9d1e826004c5475841d",
    )

    maven_jar(
        name = "flexmark-util-ast",
        artifact = "com.vladsch.flexmark:flexmark-util-ast:" + FLEXMARK_VERS,
        attach_source = False,
        sha1 = "10fff87e61b7c3bb12afddf7b418977cd02acdc8",
    )

    maven_jar(
        name = "flexmark-util-misc",
        artifact = "com.vladsch.flexmark:flexmark-util-misc:" + FLEXMARK_VERS,
        attach_source = False,
        sha1 = "d2129f4f2b55fbf645e3499c7b0cdddcfef81112",
    )

    maven_jar(
        name = "flexmark-util-visitor",
        artifact = "com.vladsch.flexmark:flexmark-util-visitor:" + FLEXMARK_VERS,
        attach_source = False,
        sha1 = "7eb0030ae2a2eec80d74790caeb4cdb6b4bf8e17",
    )

    maven_jar(
        name = "flexmark-util-builder",
        artifact = "com.vladsch.flexmark:flexmark-util-builder:" + FLEXMARK_VERS,
        attach_source = False,
        sha1 = "2d6adaf6053f72de86a050fe6967049f7c2d3500",
    )

    maven_jar(
        name = "flexmark-util-sequence",
        artifact = "com.vladsch.flexmark:flexmark-util-sequence:" + FLEXMARK_VERS,
        attach_source = False,
        sha1 = "299e3b4a4272ba9dcd6b9081b8d24d1a672a0921",
    )

    maven_jar(
        name = "flexmark-util-html",
        artifact = "com.vladsch.flexmark:flexmark-util-html:" + FLEXMARK_VERS,
        attach_source = False,
        sha1 = "fc52f860cf45f57468d8f14ee63c1e6469ee3f47",
    )

    # Transitive dependency of flexmark and gitiles
    maven_jar(
        name = "autolink",
        artifact = "org.nibor.autolink:autolink:0.10.0",
        sha1 = "6579ea7079be461e5ffa99f33222a632711cc671",
    )

    maven_jar(
        name = "greenmail",
        artifact = "com.icegreen:greenmail:" + GREENMAIL_VERS,
        sha1 = "9ea96384ad2cb8118c22f493b529eb72c212691c",
    )

    maven_jar(
        name = "mail",
        artifact = "com.sun.mail:javax.mail:" + MAIL_VERS,
        sha1 = "a055c648842c4954c1f7db7254f45d9ad565e278",
    )

    maven_jar(
        name = "mime4j-core",
        artifact = "org.apache.james:apache-mime4j-core:" + MIME4J_VERS,
        sha1 = "c62dfe18a3b827a2c626ade0ffba44562ddf3f61",
    )

    maven_jar(
        name = "mime4j-dom",
        artifact = "org.apache.james:apache-mime4j-dom:" + MIME4J_VERS,
        sha1 = "f2d653c617004193f3350330d907f77b60c88c56",
    )

    maven_jar(
        name = "jsoup",
        artifact = "org.jsoup:jsoup:1.14.3",
        sha1 = "c43a81e18e6d0eb71951aa031d55d5c293c531a6",
    )

    maven_jar(
        name = "ow2-asm",
        artifact = "org.ow2.asm:asm:" + OW2_VERS,
        sha1 = "81a03f76019c67362299c40e0ba13405f5467bff",
    )

    maven_jar(
        name = "ow2-asm-analysis",
        artifact = "org.ow2.asm:asm-analysis:" + OW2_VERS,
        sha1 = "7487dd756daf96cab9986e44b9d7bcb796a61c10",
    )

    maven_jar(
        name = "ow2-asm-commons",
        artifact = "org.ow2.asm:asm-commons:" + OW2_VERS,
        sha1 = "f4d7f0fc9054386f2893b602454d48e07d4fbead",
    )

    maven_jar(
        name = "ow2-asm-tree",
        artifact = "org.ow2.asm:asm-tree:" + OW2_VERS,
        sha1 = "d96c99a30f5e1a19b0e609dbb19a44d8518ac01e",
    )

    maven_jar(
        name = "ow2-asm-util",
        artifact = "org.ow2.asm:asm-util:" + OW2_VERS,
        sha1 = "fbc178fc5ba3dab50fd7e8a5317b8b647c8e8946",
    )

    maven_jar(
        name = "auto-common",
        artifact = "com.google.auto:auto-common:" + AUTO_COMMON_VERSION,
        sha1 = "f6da26895f759010f5f170c8044e84c1b17ef83e",
    )

    maven_jar(
        name = "auto-factory",
        artifact = "com.google.auto.factory:auto-factory:" + AUTO_FACTORY_VERSION,
        sha1 = "f81ece06b6525085da217cd900116f44caafe877",
    )

    maven_jar(
        name = "auto-service-annotations",
        artifact = "com.google.auto.service:auto-service-annotations:" + AUTO_FACTORY_VERSION,
        sha1 = "ac86dacc0eb9285ea9d42eee6aad8629ca3a7432",
    )

    maven_jar(
        name = "auto-value",
        artifact = "com.google.auto.value:auto-value:" + AUTO_VALUE_VERSION,
        sha1 = "6b126cb218af768339e4d6e95a9b0ae41f74e73d",
    )

    maven_jar(
        name = "auto-value-annotations",
        artifact = "com.google.auto.value:auto-value-annotations:" + AUTO_VALUE_VERSION,
        sha1 = "eff48ed53995db2dadf0456426cc1f8700136f86",
    )

    maven_jar(
        name = "auto-value-gson-runtime",
        artifact = "com.ryanharter.auto.value:auto-value-gson-runtime:" + AUTO_VALUE_GSON_VERSION,
        sha1 = "addda2ae6cce9f855788274df5de55dde4de7b71",
    )

    maven_jar(
        name = "auto-value-gson-extension",
        artifact = "com.ryanharter.auto.value:auto-value-gson-extension:" + AUTO_VALUE_GSON_VERSION,
        sha1 = "0c4c01a3e10e5b10df2e5f5697efa4bb3f453ac1",
    )

    maven_jar(
        name = "auto-value-gson-factory",
        artifact = "com.ryanharter.auto.value:auto-value-gson-factory:" + AUTO_VALUE_GSON_VERSION,
        sha1 = "9ed8d79144ee8d60cc94cc11f847b5ed8ee9f19c",
    )

    maven_jar(
        name = "javapoet",
        artifact = "com.squareup:javapoet:1.13.0",
        sha1 = "d6562d385049f35eb50403fa86bb11cce76b866a",
    )

    maven_jar(
        name = "autotransient",
        artifact = "io.sweers.autotransient:autotransient:1.0.0",
        sha1 = "38b1c630b8e76560221622289f37be40105abb3d",
    )

    maven_jar(
        name = "mime-util",
        artifact = "eu.medsea.mimeutil:mime-util:2.1.3",
        attach_source = False,
        sha1 = "0c9cfae15c74f62491d4f28def0dff1dabe52a47",
    )

    maven_jar(
        name = "prolog-runtime",
        artifact = "com.googlecode.prolog-cafe:prolog-runtime:" + PROLOG_VERS,
        attach_source = False,
        repository = PROLOG_REPO,
        sha1 = "e9a364f4233481cce63239e8e68a6190c8f58acd",
    )

    maven_jar(
        name = "prolog-compiler",
        artifact = "com.googlecode.prolog-cafe:prolog-compiler:" + PROLOG_VERS,
        attach_source = False,
        repository = PROLOG_REPO,
        sha1 = "570295026f6aa7b905e423d107cb2e081eecdc04",
    )

    maven_jar(
        name = "prolog-io",
        artifact = "com.googlecode.prolog-cafe:prolog-io:" + PROLOG_VERS,
        attach_source = False,
        repository = PROLOG_REPO,
        sha1 = "1f25c4e27d22bdbc31481ee0c962a2a2853e4428",
    )

    maven_jar(
        name = "cafeteria",
        artifact = "com.googlecode.prolog-cafe:prolog-cafeteria:" + PROLOG_VERS,
        attach_source = False,
        repository = PROLOG_REPO,
        sha1 = "0e6c2deeaf5054815a561cbd663566fd59b56c6c",
    )

    maven_jar(
        name = "guava-retrying",
        artifact = "com.github.rholder:guava-retrying:2.0.0",
        sha1 = "974bc0a04a11cc4806f7c20a34703bd23c34e7f4",
    )

    maven_jar(
        name = "jsr305",
        artifact = "com.google.code.findbugs:jsr305:3.0.1",
        sha1 = "f7be08ec23c21485b9b5a1cf1654c2ec8c58168d",
    )

    maven_jar(
        name = "blame-cache",
        artifact = "com.google.gitiles:blame-cache:" + GITILES_VERS,
        attach_source = False,
        repository = GITILES_REPO,
        sha1 = "31c1a6e5d92b57bb2f9db24e1032145961c09a8d",
    )

    maven_jar(
        name = "gitiles-servlet",
        artifact = "com.google.gitiles:gitiles-servlet:" + GITILES_VERS,
        repository = GITILES_REPO,
        sha1 = "c6550362c5c22d8e07edd4e2151ee12594082e76",
    )

    # prettify must match the version used in Gitiles
    maven_jar(
        name = "prettify",
        artifact = "com.github.twalcari:java-prettify:1.2.2",
        sha1 = "b8ba1c1eb8b2e45cfd465d01218c6060e887572e",
    )

    maven_jar(
        name = "html-types",
        artifact = "com.google.common.html.types:types:1.0.8",
        sha1 = "9e9cf7bc4b2a60efeb5f5581fe46d17c068e0777",
    )

    maven_jar(
        name = "icu4j",
        artifact = "com.ibm.icu:icu4j:57.1",
        sha1 = "198ea005f41219f038f4291f0b0e9f3259730e92",
    )

    maven_jar(
        name = "bcprov",
        artifact = "org.bouncycastle:bcprov-jdk18on:" + BC_VERS,
        sha1 = "d8dc62c28a3497d29c93fee3e71c00b27dff41b4",
    )

    maven_jar(
        name = "bcpg",
        artifact = "org.bouncycastle:bcpg-jdk18on:" + BC_VERS,
        sha1 = "1a36a1740d07869161f6f0d01fae8d72dd1d8320",
    )

    maven_jar(
        name = "bcpkix",
        artifact = "org.bouncycastle:bcpkix-jdk18on:" + BC_VERS,
        sha1 = "bb3fdb5162ccd5085e8d7e57fada4d8eaa571f5a",
    )

    maven_jar(
        name = "bcutil",
        artifact = "org.bouncycastle:bcutil-jdk18on:" + BC_VERS,
        sha1 = "41f19a69ada3b06fa48781120d8bebe1ba955c77",
    )

    maven_jar(
        name = "h2",
        artifact = "com.h2database:h2:1.3.176",
        sha1 = "fd369423346b2f1525c413e33f8cf95b09c92cbd",
    )

    maven_jar(
        name = "fluent-hc",
        artifact = "org.apache.httpcomponents:fluent-hc:" + HTTPCOMP_VERS,
        sha1 = "7bfdfa49de6d720ad3c8cedb6a5238eec564dfed",
    )

    maven_jar(
        name = "httpclient",
        artifact = "org.apache.httpcomponents:httpclient:" + HTTPCOMP_VERS,
        sha1 = "733db77aa8d9b2d68015189df76ab06304406e50",
    )

    maven_jar(
        name = "httpcore",
        artifact = "org.apache.httpcomponents:httpcore:4.4.4",
        sha1 = "b31526a230871fbe285fbcbe2813f9c0839ae9b0",
    )

    # Test-only dependencies below.
    maven_jar(
        name = "junit",
        artifact = "junit:junit:4.12",
        sha1 = "2973d150c0dc1fefe998f834810d68f278ea58ec",
    )

    maven_jar(
        name = "hamcrest-core",
        artifact = "org.hamcrest:hamcrest-core:1.3",
        sha1 = "42a25dc3219429f0e5d060061f71acb49bf010a0",
    )

    maven_jar(
        name = "diffutils",
        artifact = "com.googlecode.java-diff-utils:diffutils:1.3.0",
        sha1 = "7e060dd5b19431e6d198e91ff670644372f60fbd",
    )

    maven_jar(
        name = "jetty-servlet",
        artifact = "org.eclipse.jetty:jetty-servlet:" + JETTY_VERS,
        sha1 = "3ec1be0b1ca49b633dd7de0733d0054bb4763965",
    )

    maven_jar(
        name = "jetty-security",
        artifact = "org.eclipse.jetty:jetty-security:" + JETTY_VERS,
        sha1 = "a3342214ce480cc5bb8e74fe7589dd0436a5d903",
    )

    maven_jar(
        name = "jetty-server",
        artifact = "org.eclipse.jetty:jetty-server:" + JETTY_VERS,
        sha1 = "d0572c8460eb26adf8420e78535d95859c89a936",
    )

    maven_jar(
        name = "jetty-jmx",
        artifact = "org.eclipse.jetty:jetty-jmx:" + JETTY_VERS,
        sha1 = "a69e9b0a223a5f661606f6fb36d3b3fcf6216432",
    )

    maven_jar(
        name = "jetty-http",
        artifact = "org.eclipse.jetty:jetty-http:" + JETTY_VERS,
        sha1 = "fe37568aded59dd8e437e0f670fe5f809071fe8f",
    )

    maven_jar(
        name = "jetty-io",
        artifact = "org.eclipse.jetty:jetty-io:" + JETTY_VERS,
        sha1 = "a11a0713b17334a5b6e694602fbd1a9457cb5fdd",
    )

    maven_jar(
        name = "jetty-util",
        artifact = "org.eclipse.jetty:jetty-util:" + JETTY_VERS,
        sha1 = "a11df06530a3a28c9af7ff336730a2f8e18e7205",
    )

    maven_jar(
        name = "jetty-util-ajax",
        artifact = "org.eclipse.jetty:jetty-util-ajax:" + JETTY_VERS,
        sha1 = "3b2a998a5ed1f93bc1878fa89d65e307d8b8ebaf",
        src_sha1 = "027a15819d3fd1f18e1890bd1bf04b7d48cb3da4",
    )

    maven_jar(
        name = "asciidoctor",
        artifact = "org.asciidoctor:asciidoctorj:1.5.7",
        sha1 = "8e8c1d8fc6144405700dd8df3b177f2801ac5987",
    )

    maven_jar(
        name = "javax-activation",
        artifact = "javax.activation:activation:1.1.1",
        sha1 = "485de3a253e23f645037828c07f1d7f1af40763a",
    )

    maven_jar(
        name = "mockito",
        artifact = "org.mockito:mockito-core:3.3.3",
        sha1 = "4878395d4e63173f3825e17e5e0690e8054445f1",
    )

    maven_jar(
        name = "bytebuddy",
        artifact = "net.bytebuddy:byte-buddy:" + BYTE_BUDDY_VERSION,
        sha1 = "1eefb7dd1b032b33c773ca0a17d5cc9e6b56ea1a",
    )

    maven_jar(
        name = "bytebuddy-agent",
        artifact = "net.bytebuddy:byte-buddy-agent:" + BYTE_BUDDY_VERSION,
        sha1 = "c472fad33f617228601172682aa64f8b78508045",
    )

    maven_jar(
        name = "objenesis",
        artifact = "org.objenesis:objenesis:3.0.1",
        sha1 = "11cfac598df9dc48bb9ed9357ed04212694b7808",
    )

    maven_jar(
        name = "roaringbitmap",
        artifact = "org.roaringbitmap:RoaringBitmap:" + ROARING_BITMAP_VERSION,
        sha1 = "d25b4bcb67193d587f6e0617da2c6f84e2d02a9c",
    )

    maven_jar(
        name = "roaringbitmap-shims",
        artifact = "org.roaringbitmap:shims:" + ROARING_BITMAP_VERSION,
        sha1 = "e22be0d690a99c046bf9f57106065a77edad1eda",
    )
