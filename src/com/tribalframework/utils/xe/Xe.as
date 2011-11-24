﻿/*** ** XE converter** com.tribalframework.utils.xe.Xe** @ver 1.0** @date 01-07-2010***************************************/package com.tribalframework.utils.xe{	import flash.events.*;	import flash.display.*;			public class Xe	{		private var _cur1:String;		private var _cur2:String;		private var _dollar1:Number;		private var _dollar2:Number;				private var rate:Object;						private const eu_to_usd:Number = 1.24927;		private const eu_to_sgd:Number = 1.74146;		private const eu_to_gbp:Number = 0.82426;		private const eu_to_cny:Number = 8.60910;		private const eu_to_jpy:Number = 112.918;				private const usd_to_eu:Number = 0.78686;		private const usd_to_sgd:Number = 1.37544;		private const usd_to_gbp:Number = 0.65553;		private const usd_to_cny:Number = 6.77414;		private const usd_to_jpy:Number = 88.8506;				private const gbp_to_eu:Number = 1.21454;		private const gbp_to_usd:Number = 1.51915;		private const gbp_to_sgd:Number = 2.11582;		private const gbp_to_cny:Number = 10.2900;		private const gbp_to_jpy:Number = 133.633;				private const sgd_to_usd:Number = 0.72704;		private const sgd_to_eu:Number = 0.57204;		private const sgd_to_gbp:Number = 0.47653;		private const sgd_to_cny:Number = 4.86326;		private const sgd_to_jpy:Number = 63.1269;				public function Xe(){				}				/* currency code		** usd, eu, sgd, gbp, cny, jpy		** default converts sgd to usd		******************************************/		public function initXe(dollar1:Number, cur1:String="sgd", cur2:String="usd"):Number{					//	localXeRate();						_cur1 = cur1;			_cur2 = cur2			_dollar1 = dollar1;						_dollar2 = _dollar1 * this[_cur1+"_to_"+_cur2];						trace(_dollar2);						return _dollar2;		}				private function localXeRate(){			rate = new Object();						// euros 			rate["eu_to_usd"] = 1.24927;			rate["eu_to_sgd"] = 1.74146;			rate["eu_to_gbp"] = 0.82426;			rate["eu_to_cny"] = 8.47118;			rate["eu_to_jpy"] = 109.955;						// US dollars			rate["usd_to_eu"] = 0.80047;			rate["usd_to_sgd"] = 1.39376;			rate["usd_to_gbp"] = 0.65370;			rate["usd_to_cny"] = 6.77385;			rate["usd_to_jpy"] = 87.9439;						// Pound Sterling			rate["gbp_to_eu"] = 1.21454;			rate["gbp_to_usd"] = 1.51915;			rate["gbp_to_sgd"] = 2.11582;			rate["gbp_to_cny"] = 10.2900;			rate["gbp_to_jpy"] = 133.633;						// Singapore dollars			rate["sgd_to_usd"] = 0.71748;			rate["sgd_to_eu"] = 0.57428;			rate["sgd_to_gbp"] = 0.47327;			rate["sgd_to_cny"] = 4.86326;			rate["sgd_to_jpy"] = 63.1269;						// japanese yen			rate["jpy_to_sgd"] = 0.0158532;		}					}}