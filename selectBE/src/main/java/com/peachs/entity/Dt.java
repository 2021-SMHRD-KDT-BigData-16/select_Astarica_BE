package com.peachs.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Dt {
	private String imagePath;
	private String label;
	private int shapeNum;
	private int pt1x;
	private int pt1y;
	private int pt2x;
	private int pt2y;
	private int imageHeight;
	private int imageWidth;
	private int ratio;
	private int wide;
	private int bwide;
}
