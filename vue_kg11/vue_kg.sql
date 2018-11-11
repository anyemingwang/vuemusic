-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-11-09 01:55:23
-- 服务器版本： 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vue_kg`
--

-- --------------------------------------------------------

--
-- 表的结构 `kg_classify`
--

CREATE TABLE `kg_classify` (
  `yid` int(32) NOT NULL,
  `ylistname` varchar(32) DEFAULT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `kg_classify`
--

INSERT INTO `kg_classify` (`yid`, `ylistname`, `image`) VALUES
(1, '飙升榜', 'http://127.0.0.1:5001/img/index/20182222.png'),
(2, 'TOP500榜', 'http://127.0.0.1:5001/img/index/20181111.png'),
(3, '红歌榜', 'http://127.0.0.1:5001/img/index/20185555.png'),
(4, '新歌榜', 'http://127.0.0.1:5001/img/index/20183333.png'),
(5, '古风榜', 'http://127.0.0.1:5001/img/index/20184444.png');

-- --------------------------------------------------------

--
-- 表的结构 `kg_country`
--

CREATE TABLE `kg_country` (
  `cid` int(32) NOT NULL,
  `cname` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `kg_country`
--

INSERT INTO `kg_country` (`cid`, `cname`) VALUES
(1, '华语'),
(2, '欧美'),
(3, '韩国'),
(4, '日本');

-- --------------------------------------------------------

--
-- 表的结构 `kg_image`
--

CREATE TABLE `kg_image` (
  `id` int(11) NOT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `kg_image`
--

INSERT INTO `kg_image` (`id`, `img_url`, `title`) VALUES
(1, 'http://127.0.0.1:5001/img/index/2018082301.png', '图片1'),
(2, 'http://127.0.0.1:5001/img/index/2018082303.png', '图片2'),
(3, 'http://127.0.0.1:5001/img/index/2018082302.png', '图片3'),
(4, 'http://127.0.0.1:5001/img/index/2018082310.png', '图片4'),
(5, 'http://127.0.0.1:5001/img/index/2018082305.png', '图片5'),
(6, 'http://127.0.0.1:5001/img/index/2018082308.png', '图片6'),
(7, 'http://127.0.0.1:5001/img/index/2018082309.png', '图片7'),
(8, 'http://127.0.0.1:5001/img/index/2018082307.png', '图片8');

-- --------------------------------------------------------

--
-- 表的结构 `kg_like`
--

CREATE TABLE `kg_like` (
  `kid` int(6) NOT NULL,
  `ksong` varchar(32) NOT NULL,
  `ksinger` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `kg_like`
--

INSERT INTO `kg_like` (`kid`, `ksong`, `ksinger`) VALUES
(273, '违背的青春', '薛之谦'),
(274, ' Sheep', '张艺兴、Alan Walker'),
(275, '不想想你', '张杰');

-- --------------------------------------------------------

--
-- 表的结构 `kg_singer`
--

CREATE TABLE `kg_singer` (
  `sid` int(32) NOT NULL,
  `singname` varchar(32) DEFAULT NULL,
  `simg` varchar(255) NOT NULL,
  `stitle` varchar(6) NOT NULL,
  `snum` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `kg_singer`
--

INSERT INTO `kg_singer` (`sid`, `singname`, `simg`, `stitle`, `snum`) VALUES
(1, '薛之谦', 'http://127.0.0.1:5001/img/index/302.jpg', 'X', 24),
(2, '易烊千玺', 'http://127.0.0.1:5001/img/index/302.jpg', 'Y', 25),
(3, '杨凯莉', 'http://127.0.0.1:5001/img/index/302.jpg', 'Y', 25),
(4, '张学友', 'http://127.0.0.1:5001/img/index/302.jpg', 'Z', 26),
(5, '周杰伦', 'http://127.0.0.1:5001/img/index/302.jpg', 'Z', 26),
(6, '王力宏', 'http://127.0.0.1:5001/img/index/302.jpg', 'W', 23),
(7, '林俊杰', 'http://127.0.0.1:5001/img/index/302.jpg', 'L', 12),
(8, '周华健', 'http://127.0.0.1:5001/img/index/302.jpg', 'Z', 26),
(9, '五月天', 'http://127.0.0.1:5001/img/index/302.jpg', 'W', 23),
(10, '张国荣', 'http://127.0.0.1:5001/img/index/302.jpg', 'Z', 26),
(11, '萧敬腾', 'http://127.0.0.1:5001/img/index/302.jpg', 'X', 24),
(12, 'KIMI2', 'http://127.0.0.1:5001/img/index/302.jpg', 'K', 11),
(13, '王俊凯', 'http://127.0.0.1:5001/img/index/302.jpg', 'W', 23),
(14, '华晨宇', 'http://127.0.0.1:5001/img/index/302.jpg', 'H', 8),
(15, '王源', 'http://127.0.0.1:5001/img/index/302.jpg', 'W', 23),
(16, '潘玮柏', 'http://127.0.0.1:5001/img/index/302.jpg', 'P', 16),
(17, '王嘉尔', 'http://127.0.0.1:5001/img/index/302.jpg', 'W', 23),
(18, '罗志祥', 'http://127.0.0.1:5001/img/index/302.jpg', 'L', 12),
(19, '王杰', 'http://127.0.0.1:5001/img/index/302.jpg', 'W', 23),
(20, '许嵩', 'http://127.0.0.1:5001/img/index/302.jpg', 'X', 24),
(21, '徐良', 'http://127.0.0.1:5001/img/index/302.jpg', 'X', 24),
(22, '李荣浩', 'http://127.0.0.1:5001/img/index/302.jpg', 'L', 12),
(23, '李克勤', 'http://127.0.0.1:5001/img/index/302.jpg', 'L', 12),
(24, '刘德华', 'http://127.0.0.1:5001/img/index/302.jpg', 'L', 12),
(25, '李代沫', 'http://127.0.0.1:5001/img/index/302.jpg', 'L', 12),
(26, '伍佰', 'http://127.0.0.1:5001/img/index/302.jpg', 'W', 23),
(27, '郑智化', 'http://127.0.0.1:5001/img/index/302.jpg', 'Z', 26),
(28, '方大同', 'http://127.0.0.1:5001/img/index/302.jpg', 'F', 6),
(29, '罗云熙', 'http://127.0.0.1:5001/img/index/302.jpg', 'L', 12),
(30, '光良', 'http://127.0.0.1:5001/img/index/302.jpg', 'G', 0),
(31, '林志炫', 'http://127.0.0.1:5001/img/index/302.jpg', 'L', 12),
(32, '曾一鸣', 'http://127.0.0.1:5001/img/index/302.jpg', 'Z', 26),
(33, '六哲', 'http://127.0.0.1:5001/img/index/302.jpg', 'L', 12),
(34, '庞龙', 'http://127.0.0.1:5001/img/index/302.jpg', 'P', 16),
(35, '胡夏', 'http://127.0.0.1:5001/img/index/302.jpg', 'H', 8),
(37, '谭咏麟', 'http://127.0.0.1:5001/img/index/302.jpg', 'T', 20),
(38, '迪玛希', 'http://127.0.0.1:5001/img/index/302.jpg', 'D', 4),
(39, '霍尊', 'http://127.0.0.1:5001/img/index/302.jpg', 'H', 8),
(40, '陈翔', 'http://127.0.0.1:5001/img/index/302.jpg', 'C', 3),
(41, 'Adele', 'http://127.0.0.1:5001/img/index/302.jpg', 'A', 1),
(42, 'BIGBANG', 'http://127.0.0.1:5001/img/index/302.jpg', 'B', 2),
(43, 'EXO', 'http://127.0.0.1:5001/img/index/302.jpg', 'E', 5),
(45, 'G.E.M.邓紫棋', 'http://127.0.0.1:5001/img/index/302.jpg', 'G', 7),
(46, '好妹妹', 'http://127.0.0.1:5001/img/index/302.jpg', 'H', 8),
(47, 'Imagine Dragons', 'http://127.0.0.1:5001/img/index/302.jpg', 'I', 9),
(48, 'Justin Bieber', 'http://127.0.0.1:5001/img/index/302.jpg', 'J', 10),
(49, 'Katy Perry', 'http://127.0.0.1:5001/img/index/302.jpg', 'K', 11),
(50, 'Maroon 5', 'http://127.0.0.1:5001/img/index/302.jpg', 'M', 13),
(51, '那英', 'http://127.0.0.1:5001/img/index/302.jpg', 'N', 14),
(52, 'OneRepublic', 'http://127.0.0.1:5001/img/index/302.jpg', 'O', 15),
(53, '朴树', 'http://127.0.0.1:5001/img/index/302.jpg', 'P', 16),
(54, 'Rihanna', 'http://127.0.0.1:5001/img/index/302.jpg', 'R', 18),
(55, '孙燕姿', 'http://127.0.0.1:5001/img/index/302.jpg', 'S', 19),
(56, 'Tobu', 'http://127.0.0.1:5001/img/index/302.jpg', 'T', 20),
(57, '邱泽', 'http://127.0.0.1:5001/img/index/302.jpg', 'Q', 17),
(58, 'U-Nee', 'http://127.0.0.1:5001/img/index/302.jpg', 'U', 21),
(59, 'VAVA', 'http://127.0.0.1:5001/img/index/302.jpg', 'V', 22);

-- --------------------------------------------------------

--
-- 表的结构 `kg_songlist`
--

CREATE TABLE `kg_songlist` (
  `lid` int(32) NOT NULL,
  `lname` varchar(32) NOT NULL,
  `ltime` varchar(32) NOT NULL,
  `l_singer` varchar(32) NOT NULL,
  `classify_id` int(32) NOT NULL,
  `country_id` int(32) NOT NULL,
  `album` varchar(32) NOT NULL,
  `likes` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `kg_songlist`
--

INSERT INTO `kg_songlist` (`lid`, `lname`, `ltime`, `l_singer`, `classify_id`, `country_id`, `album`, `likes`) VALUES
(1, '违背的青春', '04:25', '薛之谦', 4, 1, '《违背的青春》', 1),
(2, ' Sheep', '03:20', '张艺兴、Alan Walker', 0, 1, '《 Sheep (Alan Walker Relift)》', 1),
(3, '不想想你', '05:21', '张杰', 0, 1, '《不想想你》', 1),
(4, '过敏(ALLERGY)', '03:15', 'ONER', 0, 1, '《过敏(ALLERGY)》', 0),
(5, ' 家人 (Live)', '04:24', '吴亦凡、那吾克热·玉素甫江', 0, 1, '《 家人》', 0),
(6, '江湖叹(Live)', '05:05', '何炅、李维嘉', 0, 1, '《江湖叹》', 0),
(7, ' 我不确定', '04:08', '胡彦斌', 0, 1, '《 我不确定》', 0),
(8, '给孩子的话 ', '03:55', '庞龙', 0, 1, '《给孩子的话 》', 0),
(9, '开学第一课 ', '06:01', '王鹤棣、官鸿、梁靖康、吴希泽', 0, 1, '《开学第一课 》', 0),
(10, ' I Am The Man ', '03:25', '周汤豪', 0, 1, '《 I Am The Man 》', 0),
(11, '千年之恋', '04:21', '宿涵、张神儿', 0, 1, '', 0),
(14, '性别(Live)', '03:59', '田燚', 0, 1, '《性别》', 0),
(15, '我很丑可是我很温柔(Live)', '03:55', '金志文', 0, 1, '《我很丑可是我很温柔》', 0),
(16, '无人知晓的我 (Live) ', '04:22', 'A-Lin', 0, 1, '《无人知晓的我》', 0),
(17, '你不是我的 ', '05:21', '陈势安', 0, 1, '《你不是我的 》', 0),
(18, '愿意为你去冒险', '03:55', '摩登兄弟', 0, 0, '《愿意为你去冒险》', 0),
(19, '偷不走的现在', '04:25', '于文文', 0, 0, '《偷不走的现在》', 0),
(20, '午夜的列车', '05:04', '南征北战NZBZ', 0, 0, '《午夜的列车》', 0),
(21, '每分每秒', '04:04', '曲肖冰、陈程', 0, 0, '《每分每秒》', 0),
(22, '如果不爱我 ', '05:14', '马旭东', 0, 0, '《如果不爱我 》', 0),
(23, '小生不才', '03:26', '李袁杰、李俊佑', 0, 0, '《小生不才》', 0),
(24, '一百万个可能', '03:55', '夏雨菲', 2, 0, '《一百万个可能》', 0),
(25, '我已经爱上你', '05:54', '蒙面哥', 2, 0, '《我已经爱上你》', 0),
(26, '卡路里', '03:55', '火箭少女101', 2, 0, '《卡路里》', 0),
(27, '再见只是陌生人', '04:24', '庄心妍', 0, 0, '《再见只是陌生人》', 0),
(28, '体面', '03:44', '于文文', 2, 0, '《体面》', 0),
(29, '嘴巴嘟嘟 ', '03:29', '刘子璇', 2, 0, '《嘴巴嘟嘟 》', 0),
(30, '我眼里的一粒沙 ', '04:29', '冷漠', 3, 0, '《我眼里的一粒沙 》', 0),
(32, '英雄出征 ', '05:29', '洛天依', 3, 0, '《英雄出征 》', 0),
(33, '零默契拍档', '04:22', '宋梦君', 3, 0, '《零默契拍档》', 0),
(34, '靠自己', '04:26', '金久哲', 3, 0, '《靠自己》', 0),
(35, '会不会', '04:19', '白小白', 3, 0, '《会不会》', 0),
(37, '光年之外', '04:21', '摩登兄弟', 4, 0, '《光年之外》', 0),
(38, '卡布奇诺', '03:49', '曲肖冰', 4, 0, '《卡布奇诺》', 0),
(39, '盗将行', '05:01', '莫籽、Neko(4)', 4, 0, '《盗将行》', 0),
(40, '只是听说 ', '04:09', '高安', 4, 0, '《只是听说 》', 0),
(41, '风筝误', '03:29', '刘珂矣', 5, 0, '《风筝误》', 0),
(42, '红昭愿', '03:35', '音阙诗听', 5, 0, '《红昭愿》', 0),
(43, '不见有情', '03:59', '河图', 5, 0, '《不见有情》', 0),
(44, '是风动', '04:29', '河图、银临', 5, 0, '《是风动》', 0),
(45, '牵丝戏 ', '03:55', 'Aki阿杰、银临', 5, 0, '《牵丝戏 》', 0),
(46, '悟空', '04:49', '贰婶', 5, 0, '《悟空》', 0),
(47, '告白气球 ', '04:26', '周杰伦', 0, 0, '《周杰伦的床边故事》', 0),
(48, '稻香', '04:23', '周杰伦', 0, 0, '《周杰伦的床边故事》', 0),
(49, '青花瓷', '04:55', '周杰伦', 0, 0, '《周杰伦的床边故事》', 0),
(50, '简单爱', '04:23', '周杰伦', 0, 0, '《周杰伦的床边故事》', 0),
(51, '等你下课', '03:31', '周杰伦', 0, 0, '《周杰伦的床边故事》', 0),
(52, '晴天', '03:35', '周杰伦', 0, 0, '《周杰伦的床边故事》', 0),
(53, '七里香', '03:55', '周杰伦', 0, 0, '《周杰伦的床边故事》', 0),
(54, '夜曲', '04:39', '周杰伦', 0, 0, '《周杰伦的床边故事》', 0),
(55, 'The Wrong Things', '03:27', '王源', 0, 0, '《The Wrong Things》', 0),
(56, '做我自己 ', '03:29', '王源', 0, 0, '《做我自己 》', 0),
(57, '因为遇见你', '04:22', '王源', 0, 0, '《做我自己 》', 0),
(58, '明天过后', '05:09', '王源', 0, 0, '《做我自己 》', 0),
(59, '十七', '04:34', '王源', 0, 0, '《十七》', 0),
(60, '宝贝', '04:35', '王源', 0, 0, '《宝贝》', 0),
(61, '骄傲 ', '04:28', '王源', 0, 0, '《做我自己 》', 0),
(62, '长大以后的世界', '03:49', '王源', 0, 0, '《做我自己 》', 0),
(63, '树读', '04:39', '王俊凯', 0, 0, '《树读》', 0),
(64, '我在诛仙逍遥洞 ', '05:01', '王俊凯', 0, 0, '《我在诛仙逍遥洞 》', 0),
(65, '圆梦一代', '03:36', '王俊凯', 0, 0, '《树读》', 0),
(66, '明日歌 ', '04:39', '王俊凯', 0, 0, '《树读》', 0),
(67, '明天，你好 ', '04:19', '王俊凯', 0, 0, '《树读》', 0),
(68, '摩天轮的思念 ', '03:38', '王俊凯', 0, 0, '《树读》', 0),
(69, '宠爱', '04:19', '王俊凯', 0, 0, '《树读》', 0),
(70, '焕蓝未来', '04:34', '王俊凯', 0, 0, '《树读》', 0),
(71, '丹青千里', '04:25', '易烊千玺', 0, 0, '《丹青千里》', 0),
(72, '离骚', '05:04', '易烊千玺', 0, 0, '《离骚》', 0),
(73, 'Nothing To Lose ', '04:59', '易烊千玺', 0, 0, '《Nothing To Lose 》', 0),
(74, 'Unpredictable', '03:49', '易烊千玺', 0, 0, '《Unpredictable》', 0),
(75, '你说', '03:29', '易烊千玺', 0, 0, '《你说》', 0),
(76, '对不起', '04:39', '易烊千玺', 0, 0, '《你说》', 0),
(77, '生生', '03:37', '易烊千玺', 0, 0, '《你说》', 0),
(78, '飞驰与你', '05:25', '许嵩 ', 1, 0, '《飞驰与你》', 0),
(79, ' BINBIAN病变', '04:28', '程书林', 1, 0, '《 BINBIAN病变》', 0),
(80, '作曲家', '04:27', '刘郡格', 1, 0, '《作曲家》', 0),
(81, '夜的第七章', '03:24', '宿涵 ', 1, 0, '《夜的第七章(Live)》', 0),
(82, '尼古拉斯狂想曲', '04:29', '打包安琪', 1, 0, '《尼古拉斯狂想曲》', 0),
(83, '叶雪', '04:37', '简弘亦', 1, 0, '《叶雪》', 0),
(84, '终于了解自由', '04:16', '周兴哲', 1, 0, '《终于了解自由》', 0),
(85, '我们(Live)', '04:35', '孙楠', 1, 0, '《我们》', 0),
(86, '永不失联的爱', '04:36', '伍嘉成', 1, 0, '《永不失联的爱》', 0),
(87, '错乱', '04:36', '6诗人', 1, 0, '《错乱》', 0),
(88, '为何你要背叛我', '04:02', '吴若希', 1, 0, '《为何你要背叛我》', 0),
(89, 'WHY', '03:05', '周洁琼', 1, 0, '《WHY》', 0),
(90, ' 半首歌(正式版)', '03:21', '王蓉', 1, 0, '《 半首歌》', 0),
(91, '寸缕', '04:06', '河图', 1, 0, '《寸缕》', 0),
(92, ' 倾尽天下', '04:55', '河图', 1, 0, '《 倾尽天下》', 0),
(93, '你终究不爱这世界', '04:01', '蔡维泽', 2, 0, '《你终究不爱这世界》', 0),
(94, ' 拥抱你离去', '03:26', '张北北', 2, 0, '《 拥抱你离去》', 0),
(95, '说散就散', '03:51', '袁娅维', 2, 0, '《说散就散》', 0),
(96, ' 陷阱', '04:29', '王北车', 2, 0, '《 陷阱》', 0),
(97, '一曲红尘', '03:40', '艾歌', 2, 0, '《一曲红尘》', 0),
(98, '隔壁泰山', '03:22', '阿里郎', 2, 0, '《隔壁泰山》', 0),
(99, '空空如也', '04:42', '胡66', 2, 0, '《空空如也》', 0),
(100, '去年夏天', '04:35', '王大毛', 2, 0, '《去年夏天》', 0),
(101, ' 广东爱情故事', '04:45', '广东雨神', 2, 0, '《 广东爱情故事》', 0),
(102, '让我做你的眼睛', '03:26', '杨凯莉', 2, 0, '《让我做你的眼睛》', 0),
(103, '宝贝', '04:35', '易烊千玺', 0, 0, '《树读》', 0);

-- --------------------------------------------------------

--
-- 表的结构 `kg_user`
--

CREATE TABLE `kg_user` (
  `uid` int(11) NOT NULL,
  `uname` varchar(32) DEFAULT NULL,
  `upwd` varchar(32) DEFAULT NULL,
  `sex` varchar(8) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `kg_user`
--

INSERT INTO `kg_user` (`uid`, `uname`, `upwd`, `sex`, `img`) VALUES
(4, 'bai', '123456', '1', 'http://127.0.0.1:5001/img/index/1111login.jpg'),
(5, 'anye', '123456', '0', 'http://127.0.0.1:5001/img/index/2222login.jpg'),
(6, 'dangdang', '123456', '1', 'http://127.0.0.1:5001/img/index/3333login.jpg'),
(7, 'doudou', '123456', '1', 'http://127.0.0.1:5001/img/index/4444login.jpg'),
(8, 'yaya', '123456', '0', 'http://127.0.0.1:5001/img/index/5555login.jpg'),
(9, '11111', '123456', '0', 'http://127.0.0.1:5001/img/index/6666login.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kg_classify`
--
ALTER TABLE `kg_classify`
  ADD PRIMARY KEY (`yid`);

--
-- Indexes for table `kg_country`
--
ALTER TABLE `kg_country`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `kg_image`
--
ALTER TABLE `kg_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kg_like`
--
ALTER TABLE `kg_like`
  ADD PRIMARY KEY (`kid`);

--
-- Indexes for table `kg_singer`
--
ALTER TABLE `kg_singer`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `kg_songlist`
--
ALTER TABLE `kg_songlist`
  ADD PRIMARY KEY (`lid`);

--
-- Indexes for table `kg_user`
--
ALTER TABLE `kg_user`
  ADD PRIMARY KEY (`uid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `kg_image`
--
ALTER TABLE `kg_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `kg_like`
--
ALTER TABLE `kg_like`
  MODIFY `kid` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=276;

--
-- 使用表AUTO_INCREMENT `kg_singer`
--
ALTER TABLE `kg_singer`
  MODIFY `sid` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- 使用表AUTO_INCREMENT `kg_user`
--
ALTER TABLE `kg_user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
