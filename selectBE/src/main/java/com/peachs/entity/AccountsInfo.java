package com.peachs.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class AccountsInfo {
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_com;
	private String user_job;
}
