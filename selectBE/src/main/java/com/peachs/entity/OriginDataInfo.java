package com.peachs.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OriginDataInfo {
	private int od_idx;
	private String user_id;
	private String od_name;
	private String od_path;
	private Date od_date;
}
