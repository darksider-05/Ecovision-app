import 'package:flutter/material.dart';
import 'page0.dart';
import "pageG.dart";
import "crypto.dart";

List<Widget> pages  = [
  PageZero() ,
  GlobalPage(pageTitle: "all news", pageVar: "allNews"),
  GlobalPage(pageTitle: "Economy", pageVar: "ecoNews"),
  GlobalPage(pageTitle: "Finance", pageVar: "finNews"),
  GlobalPage(pageTitle: "Market", pageVar: "marNews"),
  GlobalPage(pageTitle: "Investing", pageVar: "invNews"),
  GlobalPage(pageTitle: "Technology", pageVar: "tecNews"),
  GlobalPage(pageTitle: "Science", pageVar: "sciNews"),
  CryPage()];