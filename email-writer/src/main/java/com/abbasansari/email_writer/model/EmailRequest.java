package com.abbasansari.email_writer.model;

import lombok.Data;

@Data
public class EmailRequest {
    private String emailContent;
    private String tone;
}
