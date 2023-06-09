package com.peachs.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Csv {
	private String imagePath;
	private String label;
	private int shapeNum;
	private int point1_x;
	private int point1_y;
	private int point2_x;
	private int point2_y;
	private int imageHeight;
	private int imageWidth;
	private String ratio;
	private String wide;
	private String bwide;
}
