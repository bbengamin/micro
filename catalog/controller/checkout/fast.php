<?php
class ControllerCheckoutFast extends Controller {
	public function callback(){
		$json = array();

		if(!isset($this->request->post['name']) || strlen($this->request->post['name']) == 0){
			$json['error']['name'] = "Введите корректное имя";
		}

		if(!isset($this->request->post['phone']) || strlen($this->request->post['phone']) == 0){
			$json['error']['phone'] = "Введите корректный телефон";
		}

		if(!$json){	
			$email = 'ucp-09@mail.ru';

			$text = "Обратный звонок" . "\n\n";
			$text .= "Имя:" . $this->request->post['name'] . "\n";
			$text .= "Телефон:" .  $this->request->post['phone'] . "\n";
			if(isset($this->request->post['comment']) && strlen($this->request->post['comment']) == 0){
				$text .= "Комментарий:" .  $this->request->post['comment'];
			}

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($email);
			$mail->setFrom($email);
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(html_entity_decode("MicroзайМ. Обратный звонок.", ENT_QUOTES, 'UTF-8'));
			$mail->setText($text);
			$mail->send();

			$json['success'] = 'success';
		}
		$this->response->setOutput(json_encode($json));
	}

	public function fastorder(){
		$this->load->language('checkout/fast');
		$json = array();

		if(!isset($this->request->post['lastname']) || strlen($this->request->post['lastname']) == 0){
			$json['error']['lastname'] = "Введите корректную фамилию";
		}
		
		if(!isset($this->request->post['name']) || strlen($this->request->post['name']) == 0){
			$json['error']['name'] = "Введите корректное имя";
		}
		
		if(!isset($this->request->post['theardname']) || strlen($this->request->post['theardname']) == 0){
			$json['error']['theardname'] = "Введите корректное отчество";
		}
		
		if(!isset($this->request->post['pasp-series']) || strlen($this->request->post['pasp-series']) == 0){
			$json['error']['pasp-series'] = "Введите корректную серию паспорта";
		}
		
		if(!isset($this->request->post['pasp-number']) || strlen($this->request->post['pasp-number']) == 0){
			$json['error']['pasp-number'] = "Введите корректный номер паспорта";
		}

		if(!isset($this->request->post['phone']) || strlen($this->request->post['phone']) == 0){
			$json['error']['phone'] = "Введите корректный телефон";
		}

		if(!$json){
			$email = 'ucp-09@mail.ru';


			$text = "Новая заявка" . "\n";
			$text .= "ФИО:" . $this->request->post['lastname'] . " " . $this->request->post['name'] . " " . $this->request->post['theardname'] . "\n";
			$text .= "Телефон:" .  $this->request->post['phone'] . "\n";
			$text .= "Паспорт:" .  $this->request->post['pasp-series'] . " " . $this->request->post['pasp-number'] . "\n";
			$text .= "Цена займа:" .  $this->request->post['price'] . "\n";
			$text .= "Кол-во дней:" .  $this->request->post['days'] . "\n";


			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($email);
			$mail->setFrom($email);
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(html_entity_decode("MicroзайМ. Новая заявка.", ENT_QUOTES, 'UTF-8'));
			$mail->setText($text);
			$mail->send();

			$json['success'] = 'success';
		}
		$this->response->setOutput(json_encode($json));
	}
}
